//
//  JobsViewController.swift
//  Field Monitoring
//
//  Created by Ajith Panneerselvam on 22/08/17.
//  Copyright © 2017 R.M.K. Engineering College. All rights reserved.
//

import UIKit

class JobsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var jobsList: Array<Any> = []
    var jobs = [Jobs]()
    
    var jobTitleList: Array<Any> = []
    var skillsList: Array<Any> = []
    var experienceList: Array<Any> = []
    var salaryList: Array<Any> = []
    var locationList: Array<Any> = []
    var temp: Array<Array<Double>> = []
//    print ("JOBS \n\n")
    
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (jobsList.count)
    }
    
    
    
    func getData(){
        for job in jobsList{
            print(job)
            let title : String = (job as AnyObject)["jobTitle"] as! String
            let experience : String = (job as AnyObject)["experience"] as! String
            let salary :  String = (job as AnyObject)["salary"] as! String
            jobTitleList.append((job as AnyObject)["jobTitle"]!!)
            skillsList.append((job as AnyObject)["skills"]!!)
            //experienceList.append((job as AnyObject)["experience"]!!)
            temp = [(job as AnyObject)["location"]!! as! Array]
            print(temp[0][0],temp[0][1])
            guard let jobVal = Jobs(title: title, experience:  experience,salary : salary) else {
                fatalError("Unable to instantiate meal1")
            }
        }
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text =  jobTitleList[indexPath.row] as? String
        return (cell)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
//        print (jobsList)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
