//
//  Match.swift
//  Tests
//
//  Created by Samuel Resendez on 1/16/16.
//  Copyright © 2016 Samuel Resendez. All rights reserved.
//

import UIKit

class Match: NSObject {
    
    override init() {
        super.init()
    }
    var number = ""
    var blueAllianceTeamNumbers = [Int]()
    var redAllianceTeamNumbers = [Int]()
    var blueScore = ""
    var redScore = ""
    var predictedRedScore = -1
    var predictedBlueScore = -1
    
    func changeRedScore(score:String) {
        self.redScore = score
    }
    func changeBlueScore(score:String) {
        self.blueScore = score
    }
    func changeBlueAllianceTeamNumbers(teamNumbers:[Int]) {
        self.blueAllianceTeamNumbers = teamNumbers
    }
    func changeRedAllianceTeamNumbers(teamNumbers:[Int]) {
        self.redAllianceTeamNumbers = teamNumbers
    }
    

}
