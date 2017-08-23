//
//  Jobs.swift
//  
//
//  Created by R.M.K. Engineering College on 23/08/17.
//
//

import UIKit

class Jobs{
    var title :  String
    var experience :  String
    var salary : String
    
    init?(title: String, experience :  String, salary :  String) {
        
        // The name must not be empty
    
        
        // Initialize stored properties.
        self.title = title
        self.experience = experience
        self.salary = salary
        
    }
}
