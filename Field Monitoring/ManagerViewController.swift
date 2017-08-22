//
//  ManagerViewController.swift
//  Field Monitoring
//
//  Created by R.M.K. Engineering College on 01/07/17.
//  Copyright © 2017 R.M.K. Engineering College. All rights reserved.
//

import UIKit
import Alamofire

class ManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    var latitude = 0.0
    var longitude = 0.0
    var address = ""
    var mapContent = ""
    
    @IBOutlet var taskTitle: UITextField!

    @IBOutlet var skills: UITextField!
    
    @IBOutlet var experience: UITextField!

    @IBOutlet var salary: UITextField!
    
    @IBOutlet var jobLocation: UITextField!
    
    
    @IBAction func assignJob(_ sender: Any) {
        let jobTitleValue = taskTitle.text
        let skillValue = skills.text
        let experienceValue = experience.text
        let salaryValue = salary.text
        let jobLoc = jobLocation.text
        let urlPath :String = "https://field-monitoring.herokuapp.com/users/postjob/"
        let parametersValue = ["jobTitle" : jobTitleValue, "salary" : salaryValue, "experience" : experienceValue, "address" : jobLoc, "skills" : skillValue]
        
        self.mapContent = "Job: " + jobTitleValue! + "\nSkills: " + skillValue!
        self.mapContent +=  "\nExperience: " + experienceValue! + "\nSalary : " + salaryValue!
        
        Alamofire.request(urlPath, method: .post, parameters: parametersValue, encoding: JSONEncoding.default, headers: [:])
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching colors: \(String(describing: response.result.error))")
                    return
                }
                
                guard let responseJSON = response.result.value as? [String: String],
                let status = responseJSON["message"],
                let latitiude = responseJSON["latitude"],
                let address = responseJSON["address"],
                let longitude = responseJSON["longitude"] else {return}
                
                self.latitude = Double(latitiude)!
                self.longitude = Double(longitude)!
                self.address = address
               
                if (status == "success"){
                    self.performSegue(withIdentifier:"mapSegue", sender: self)
                }
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapViewController = segue.destination as! MapViewController
        //print("\n\n\n Lat-Long")
        //print (latitude, longitude)
        mapViewController.lat = latitude
        mapViewController.long = longitude
        mapViewController.address = address
        mapViewController.mapContent = mapContent
    }
    
}

   

