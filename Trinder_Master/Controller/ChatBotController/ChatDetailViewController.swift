//
//  ChatDetailViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 14/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ChatDetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var iconImageView: UIImageView!
    var decheteriesCollection = DecheteryCollection()
    let regionInMeters: Double = 6000
    let distanceSpan: CLLocationDistance = 500
    let locationManager = CLLocationManager()
    let locationAtLong = CLLocationCoordinate2D(latitude: 48.854697, longitude: 2.435986)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        animateIcon()
        createAnnotations(locations: decheteriesCollection.dechetteriesLocations)
                   checkLocationService()
        zoomLevel()
        mapView.showsUserLocation = true
        
    }
    
    private func addShadow() {
       guard let view = iconImageView else { return }
       view.layer.shadowColor = UIColor.black.cgColor
       view.layer.shadowRadius = 2.0
       view.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
       view.layer.shadowOpacity = 0.5
   }
    
    func animateIcon() {
       UIView.animate(withDuration: 0.2, animations:  {
           self.iconImageView.frame.size.width += 10
           self.iconImageView.frame.size.height += 10
       }) { _ in
           UIView.animate(withDuration: 0.5, delay: 0.25, options: [.autoreverse, .repeat], animations: {
               self.iconImageView.frame.origin.y -= 10
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
