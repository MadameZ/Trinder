//
//  GameSecondViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 14/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class WrongAnswerdViewController: UIViewController {

    
    @IBOutlet weak var redTrashImageView: UIImageView!
    @IBOutlet weak var objectImageView: UIImageView!
    @IBOutlet weak var textDescriptionView: UITextView!
    @IBOutlet weak var rghtAnswerImageView: UIImageView!
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    
    var object = UIImage()
    var idObject = 0
    var rightAnswerImage = UIImage()
    var text = ""
    
    var decheteriesCollection = DecheteryCollection()
    let regionInMeters: Double = 6000
    let distanceSpan: CLLocationDistance = 500
     let locationAtLong = CLLocationCoordinate2D(latitude: 48.854697, longitude: 2.435986)
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        objectImageView.image = object
        textDescriptionView.text = text
        rghtAnswerImageView.image = rightAnswerImage
        decheteryObject()
        createAnnotations(locations: decheteriesCollection.dechetteriesLocations)
        checkLocationService()
        zoomLevel()
        mapView.showsUserLocation = true
    }
    

    @IBAction func didTapHisttoryButton(_ sender: UIButton) {
        presentAlert(title: "C'est fait", message: "Cet objet a bien été ajouté à ton historique")
    }
    
    func decheteryObject() {
        if idObject == 4 {
            mapView.isHidden = false
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
// MARK:- Methods for the view
extension WrongAnswerdViewController {
    private func addShadow() {
         guard let view = backgroundView else { return }
         view.layer.shadowColor = UIColor.black.cgColor
         view.layer.shadowRadius = 2.0
         view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
         view.layer.shadowOpacity = 0.5
     }
}

// MARK:- Alert
extension WrongAnswerdViewController {
    
    private func presentAlert(title: String, message: String) {
//        let imageView = UIImageView(frame: CGRect(x: 100, y: 10, width: 200, height: 200))
//        imageView.image = UIImage(named: "goldTrash")
        let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let answer = UIAlertAction(title: "ok", style: .default, handler: { (UIAlertAction) in
        
        })
        
        alerController.addAction(answer)
        present(alerController, animated: true, completion: nil)
    }
    
}
