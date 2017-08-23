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
    var jobList: Array<Any> = []
    
    
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
//            let latitude = Double(location.coordinate.latitude)
//            let longitude = Double(location.coordinate.longitude)
//            print("\n\n\nlat-long")
//            print(latitude, longitude)
            let latitude = 13.1509828
            let longitude = 80.2450685
            var urlPath :String = "https://field-monitoring.herokuapp.com/users/getbylocation/" + String(latitude) + "/"
            urlPath += String(longitude)
//            print (urlPath)
            
            Alamofire.request(urlPath, method: .get, encoding: JSONEncoding.default, headers: [:])
                .responseJSON { response in
                    guard response.result.isSuccess else {
                        print("Error while fetching colors: \(String(describing: response.result.error))")
                        return
                    }
                    guard let responseJSON = response.result.value as? [Any]? else { return }
                    self.jobList = responseJSON!
                    self.performSegue(withIdentifier: "sendJobs", sender: self)
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error : Error){
        print("Failed")
        let latitude = 13.1509828
        let longitude = 80.2450685
        var urlPath :String = "https://field-monitoring.herokuapp.com/users/getbylocation/" + String(latitude) + "/"
        urlPath += String(longitude)
        Alamofire.request(urlPath, method: .get, encoding: JSONEncoding.default, headers: [:])
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching colors: \(String(describing: response.result.error))")
                    return
                }
                guard let responseJSON = response.result.value as? [Any]? else { return }
                self.jobList = responseJSON!
                self.performSegue(withIdentifier: "sendJobs", sender: self)
        }
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! JobsViewController
        nextViewController.jobsList = jobList
    }
    
}
