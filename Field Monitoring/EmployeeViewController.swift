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
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestLocation()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let location = locations.first{
            print("User's Location: \(location)")
            print ("\n\nBelow")
//            let latitude = Double(location.coordinate.latitude)
//            let longitude = Double(location.coordinate.longitude)
            
            let latitude = 13.1509828
            let longitude = 80.2450685
            
            print (latitude, longitude)
            
            var urlPath :String = "https://field-monitoring.herokuapp.com/users/getbylocation/" + String(latitude) + "/"
            urlPath += String(longitude)

            print (urlPath)
            
            Alamofire.request(urlPath, method: .get, encoding: JSONEncoding.default, headers: [:])
                .responseJSON { response in
                    guard response.result.isSuccess else {
                        print("Error while fetching colors: \(String(describing: response.result.error))")
                        return
                    }
//                    print (response.result.value!)
                    
                    guard let responseJSON = response.result.value as? [Any]?,
                    let item = responseJSON?.first as? [String: Any],
                    let skills = item["skills"] else { return }
                    print (responseJSON)
                    print("\n\n")
                    print(item)
                    print("\n\n\n\n SKILLS")
                    print(skills)
                    
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error){
        print("Failed")
    }
    
    
}
