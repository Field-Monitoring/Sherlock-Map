//
//  ViewController.swift
//  Field Monitoring
//
//  Created by R.M.K. Engineering College on 01/07/17.
//  Copyright © 2017 R.M.K. Engineering College. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var secondaryView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()
        secondaryView.layer.cornerRadius = 20;
       
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func login_Button(_ sender: Any) {
        activityIndicator.startAnimating()
        let emailValue = email.text
        let passwordValue = password.text
        let parameters = ["email" : emailValue, "password" : passwordValue ]
        let urlPath :String = "https://field-monitoring.herokuapp.com/users/login"
        
        Alamofire.request(urlPath, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:])
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching colors: \(String(describing: response.result.error))")
                    return
                }
//                print(response.result.value!)
                guard let responseJSON = response.result.value as? [String: String],
                    let position = responseJSON["position"],
                    let status = responseJSON["message"] else { return }
//                    print (responseJSON)
                
                if ( status == "success"){
                    if position == "manager" {
                        //print ("Manager Success")
                        self.performSegue(withIdentifier:"managerLogin", sender: self)
                        self.activityIndicator.stopAnimating()
                    }
                    else if position == "employee"{
                        //print ("Employee Success")
                        self.performSegue(withIdentifier:"jobSegue", sender: self)
                        self.activityIndicator.stopAnimating()
                    }
                }
                else{
                    self.activityIndicator.stopAnimating()
                    print("\n\n\nelse block\n\n\n")
                    let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }

                
        }
        
    }
}
