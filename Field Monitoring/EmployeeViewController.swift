//
//  EmployeeViewController.swift
//  Field Monitoring
//
//  Created by R.M.K. Engineering College on 01/07/17.
//  Copyright © 2017 R.M.K. Engineering College. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire


class EmployeeViewController: UIViewController,CLLocationManagerDelegate  {
    
//    let locationManager = CLLocationManager()

    
//    var locationManager: CLLocationManager!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestLocation()
        
//        if (CLLocationManager.locationServicesEnabled())
//        {
//            locationManager = CLLocationManager()
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.requestAlwaysAuthorization()
//            locationManager.startUpdatingLocation()
//        }
//        
        // For use when the app is open & in the background
        //locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
//            locationManager.startUpdatingLocation()
//        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // Print out the location to the console
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            var lat = 0.0, long = 0.0
//            lat = location.coordinate.latitude
//            long = location.coordinate.longitude
//            print(lat, long)
//            
////            var urlPath :String = "https://field-monitoring.herokuapp.com/users/getbylocation/"
//            
//            if (lat != 0.0 && long != 0.0){
//                self.performSegue(withIdentifier:"sendJobs", sender: self)
//
////                urlPath += String(lat) + "/" + String(long)
////                
////                Alamofire.request(urlPath, method: .post, encoding: JSONEncoding.default, headers: [:])
////                    .responseJSON { response in
////                        guard response.result.isSuccess else {
////                            print("Error while fetching colors: \(String(describing: response.result.error))")
////                            return
////                        }
//                
//                
////                        guard let responseJSON = response.result.value as? [String: Any],
//                        
//                        
////                        if (status == "success"){
////                            self.performSegue(withIdentifier:"mapSegue", sender: self)
////                        }
//                        
//                        
//                
//            }
//            
//        }
//    }
//   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        if let location = locations.first{
            print("User's Location: \(location)")
            print ("\n\nBelow")
            print (location.coordinate.latitude, location.coordinate.longitude)
        }
        
        
//        let location = locations.last! as CLLocation
//        
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        
//        print(location.coordinate.latitude, location.coordinate.longitude)
    
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error){
        print("Failed")
    }
    
    
    
    
}
