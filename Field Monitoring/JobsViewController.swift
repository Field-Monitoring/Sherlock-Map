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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (jobsList.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text =  jobsList[indexPath.row] as? String

        var temp : String;
        for job in jobsList{
            print(job)
            print ("SKILLS\n\n")
            print((job as AnyObject)["skills"]!)
            temp = (job as AnyObject)["skills"]! as! String
            cell.textLabel?.text = temp
        }
        
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print (jobsList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
