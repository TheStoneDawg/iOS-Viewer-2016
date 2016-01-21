//
//  TeamViewController.swift
//  Tests
//
//  Created by Samuel Resendez on 1/20/16.
//  Copyright © 2016 Samuel Resendez. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    //Set by Pervious View Controller
    var teamNumber = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamNumber)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
