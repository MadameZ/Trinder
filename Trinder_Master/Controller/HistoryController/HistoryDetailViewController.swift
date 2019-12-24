//
//  HistoryDetailViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 13/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HistoryDetailViewController: UIViewController {

    @IBOutlet weak var nameObjectLabel: UILabel!
    @IBOutlet weak var descriptionObjectLabel: UITextView!
    @IBOutlet weak var itemsOfSection: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var iconTrash: UIImageView!
    @IBOutlet weak var adviseTextView: UITextView!
    @IBOutlet weak var backgroundAdviseView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
  
        var imagePassed = UIImage()
        var iconTrashPassed = UIImage()
        
        var decheteriesCollection = DecheteryCollection()
        let regionInMeters: Double = 6000
        let locationAtLong = CLLocationCoordinate2D(latitude: 48.854697, longitude: 2.435986)
        let distanceSpan: CLLocationDistance = 500
        let locationManager = CLLocationManager()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupImageView()
            addShadow()
            animateIcon()
            createAnnotations(locations: decheteriesCollection.dechetteriesLocations)
            checkLocationService()
            zoomLevel()
            mapView.showsUserLocation = true
        }
           
        private func setupImageView() {
            itemsOfSection.image = imagePassed
            textForImage()
            backgroundAdviseView.layer.cornerRadius = 10
        }
        
        private func textForImage() {
            for image in Object.houseTrash.imageObject {
                if imagePassed == image {
                    nameObjectLabel.text = "Non recyclable"
                    descriptionObjectLabel.text = Message.infoHouseTrash
                    iconTrash.image = #imageLiteral(resourceName: "trash1")
                    adviseTextView.text = Message.adviseHouseTrash
                    backgroundAdviseView.layer.borderWidth = 0.5
                    backgroundAdviseView.layer.borderColor = UIColor.brown.cgColor
                    mapView.isHidden = true
                }
            }
            for image in Object.recycleTrash.imageObject {
                if imagePassed == image {
                    nameObjectLabel.text = "Poubelle jaune"
                    descriptionObjectLabel.text = Message.infoRecycleTrash
                    iconTrash.image = #imageLiteral(resourceName: "trash2")
                    adviseTextView.text = Message.adviseRecycleTrash
//                    backgroundAdviseView.layer.borderWidth = 0.5
//                    backgroundAdviseView.layer.borderColor = UIColor(red: 242/255, green: 202/255, blue: 41/255, alpha: 1 ).cgColor
//
                    mapView.isHidden = true
                }
            }
            
            for image in Object.glassTrash.imageObject {
                if imagePassed == image {
                    nameObjectLabel.text = "Poubelle blanche"
                    descriptionObjectLabel.text = Message.infoGlassTrash
                    iconTrash.image = #imageLiteral(resourceName: "trash3")
                    adviseTextView.text = Message.adviseGlassTrash
//                    backgroundAdviseView.layer.borderWidth = 0.5
//                    backgroundAdviseView.layer.borderColor = UIColor.black.cgColor
                    mapView.isHidden = true
                   
                }
            }
            
            for image in Object.dechetery.imageObject {
                if imagePassed == image {
                    nameObjectLabel.text = "Dechetterie"
                    descriptionObjectLabel.text = Message.infoDechetery
                    adviseTextView.text = Message.adviseDechetery
                    iconTrash.image = #imageLiteral(resourceName: "trash4")
                    mapView.isHidden = false
//                    adviseTextView.isHidden = true
//                    backgroundAdviseView.isHidden = true
                }
            }
 
        }
        
     
    
// MARK:- methods for the view
    
        private func addShadow() {
            guard let view = backgroundView else { return }
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 2.0
            view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            view.layer.shadowOpacity = 0.5
        }
        
        func animateIcon() {
            UIView.animate(withDuration: 0.2, animations:  {
                self.iconTrash.frame.size.width += 10
                self.iconTrash.frame.size.height += 10
            }) { _ in
                UIView.animate(withDuration: 0.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                    self.iconTrash.frame.origin.y -= 10
                })
            }
        }
        
    // MARK:- map's methods
        
        func createAnnotations(locations:[[String : Any]]) {

            for locations in locations {
                let annotations = MKPointAnnotation()
                annotations.title = locations["name"] as? String
                annotations.coordinate = CLLocationCoordinate2D(latitude: locations["latitude"] as! CLLocationDegrees, longitude: locations["longitude"] as! CLLocationDegrees)
                annotations.subtitle = locations["description"] as? String
              
                mapView.addAnnotation(annotations)
              
            }
        }
        
        func zoomLevel() {
//            if let location = locationManager.location?.coordinate {
                let region = MKCoordinateRegion.init(center: locationAtLong, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
                mapView.setRegion(region, animated: true)
//            }
        }
     
        func checkLocationService() {
            if CLLocationManager.locationServicesEnabled() {
                setupLocationManager()
                checkLocationAuthorization()
            } else {
                /// Show alert letting the user they have to turn this on
            }
        }
        
        func setupLocationManager() {
//            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
        
        func checkLocationAuthorization() {
            
            switch CLLocationManager.authorizationStatus() {
            /// When the app is open
            case .authorizedWhenInUse:
                /// for see the blue location
                mapView.showsUserLocation = true
                zoomLevel()
                locationManager.startUpdatingLocation()
         
            /// Show alert instructing them how to turn on permissions with plist
            case .denied:
                break
            case .notDetermined:
                /// When it's not determined, we have permission
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
            /// Show alert instructing themletting them how what's up
            break
            /// When the app is on the background
            case .authorizedAlways:
                break
                
            default:
                break
            }
        }
}
