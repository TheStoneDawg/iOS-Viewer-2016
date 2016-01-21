//
//  MatchViewController.swift
//  
//
//  Created by Samuel Resendez on 1/16/16.
//
//

import UIKit
import Firebase

class MatchViewController: UIViewController {
    //should be set by segue
    var matchNumber = -1
    
    let refString = "https://1678-dev-2016.firebaseio.com/Matches"
    
    //let matchReference = Firebase(url:"https://1678-dev-2016.firebaseio.com/Matches")

    @IBOutlet weak var redScoreLabel: UILabel!
    
    @IBOutlet weak var blueScoreLabel: UILabel!
    
    @IBOutlet weak var redPredictedLabel: UILabel!
    
    @IBOutlet weak var bluePredictedLabel: UILabel!
    
    @IBOutlet weak var redErrorLabel: UILabel!
    
    @IBOutlet weak var blueErrorLabel: UILabel!
    
    @IBOutlet weak var redTeamOneLabel: UIButton!
    
    @IBOutlet weak var redTeamTwoLabel: UIButton!
    
    @IBOutlet weak var redTeamThreeLabel: UIButton!
    
    @IBOutlet weak var blueTeamOneLabel: UIButton!
    
    @IBOutlet weak var blueTeamTwoLabel: UIButton!
    
    @IBOutlet weak var blueTeamThreeLabel: UIButton!
    
    var match = Match()
    
    
    
    
    @IBAction func teamTapped(sender: UIButton) {
        performSegueWithIdentifier("GoToTeamController", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.matchNumber)
       let finalString = self.refString + "/" + String(self.matchNumber)
        print(finalString)
        let matchReference = Firebase(url:finalString)
        matchReference.observeEventType(.Value, withBlock: { snapshot in
            
            let blueScore = snapshot.value.objectForKey("blueScore") as? Int
            let redScore = snapshot.value.objectForKey("redScore") as? Int
            let redTeams = snapshot.value.objectForKey("redAllianceTeamNumbers") as? [Int]?
            let blueTeams = snapshot.value.objectForKey("blueAllianceTeamNumbers") as? [Int]?
            let calcData = snapshot.value.objectForKey("calculatedData")
            
            let predictedRedScore = calcData?.objectForKey("predictedRedScore")
            let predictedBlueScore = calcData?.objectForKey("predictedBlueScore")
            
            print(predictedBlueScore)
            print(predictedRedScore)
            
            
            self.match.redAllianceTeamNumbers = redTeams!!
            self.match.blueAllianceTeamNumbers = blueTeams!!
            self.match.blueScore = String(blueScore!)
            self.match.redScore = String(redScore!)
            self.match.predictedRedScore = (predictedRedScore! as? Int)!
            self.match.predictedBlueScore = (predictedBlueScore! as? Int)!
           
            
            self.setupUI()
        })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        self.redScoreLabel!.text = self.match.redScore
        self.blueScoreLabel!.text = self.match.blueScore
        self.blueTeamOneLabel!.titleLabel!.text = String(self.match.blueAllianceTeamNumbers[0])
        self.blueTeamTwoLabel!.titleLabel!.text = String(self.match.blueAllianceTeamNumbers[1])
        self.blueTeamThreeLabel!.titleLabel!.text = String(self.match.blueAllianceTeamNumbers[2])
        
        self.redTeamOneLabel!.titleLabel!.text = String(self.match.redAllianceTeamNumbers[0])
        self.redTeamTwoLabel!.titleLabel!.text = String(self.match.redAllianceTeamNumbers[1])
        self.redTeamThreeLabel!.titleLabel!.text = String(self.match.redAllianceTeamNumbers[2])
        
        self.redPredictedLabel!.text = String(self.match.predictedRedScore)
        self.bluePredictedLabel!.text = String(self.match.predictedBlueScore)
        
    }
    

  
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let button = sender as? UIButton
        if let dest = segue.destinationViewController as? TeamViewController {
            dest.teamNumber = Int((button?.titleLabel!.text!)!)!
            
        }
    }


}
