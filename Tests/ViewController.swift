//
//  ViewController.swift
//  Tests
//
//  Created by Samuel Resendez on 1/14/16.
//  Copyright © 2016 Samuel Resendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let dataFetcher = FirebaseDataFetcher()
        dataFetcher.pullTeamList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

