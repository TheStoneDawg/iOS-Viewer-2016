//
//  MatchTableViewController.swift
//  Tests
//
//  Created by Samuel Resendez on 1/16/16.
//  Copyright © 2016 Samuel Resendez. All rights reserved.
//

import UIKit
import Firebase

class ScheduleTableViewController: UITableViewController {
    
    let rootReference = Firebase(url:"https://1678-dev-2016.firebaseio.com/")
    var matchList = [String?]()
    var classMatchList = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ScheduleTableViewController", bundle: nil), forCellReuseIdentifier: "MatchTableViewCell")
        
        rootReference.observeEventType(.Value, withBlock: { snapshot in
            for secondChild in snapshot.childSnapshotForPath("Matches").children {
                self.matchList.append(secondChild.key)
            }
            self.tableView.reloadData()
        })
        let matchReference = Firebase(url:"https://1678-dev-2016.firebaseio.com/Matches")
        matchReference.observeEventType(.ChildAdded, withBlock: { snapshot in
            let match = Match()
            match.number = snapshot.key
            match.blueScore = String(snapshot.value.objectForKey("blueScore")!)
            match.redScore = String(snapshot.value.objectForKey("redScore")!)
            let redNumbers = snapshot.value.objectForKey("redAllianceTeamNumbers") as! [Int]?
            let blueNumbers = snapshot.value.objectForKey("blueAllianceTeamNumbers") as! [Int]?
            match.redAllianceTeamNumbers = redNumbers!
            match.blueAllianceTeamNumbers = blueNumbers!
            self.classMatchList.append(match)
            self.tableView.reloadData()
        })
            
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(matchList.count)
        return matchList.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchTableViewCell", forIndexPath: indexPath) as! MatchTableViewCell
        
        cell.redOneLabel!.text = String(self.classMatchList[indexPath.row].redAllianceTeamNumbers[0])
        cell.redTwoLabel!.text = String(self.classMatchList[indexPath.row].redAllianceTeamNumbers[1])
        cell.redThreeLabel!.text = String(self.classMatchList[indexPath.row].redAllianceTeamNumbers[2])
        cell.blueOneLabel!.text = String(self.classMatchList[indexPath.row].blueAllianceTeamNumbers[0])
        cell.blueTwoLabel!.text = String(self.classMatchList[indexPath.row].blueAllianceTeamNumbers[1])
        cell.blueThreeLabel!.text = String(self.classMatchList[indexPath.row].blueAllianceTeamNumbers[2])
        cell.matchNumberLabel!.text = self.classMatchList[indexPath.row].number
        cell.redScoreLabel!.text = self.classMatchList[indexPath.row].redScore
        cell.blueScoreLabel!.text = self.classMatchList[indexPath.row].blueScore


        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        performSegueWithIdentifier("scheduleToMatchSegue", sender: cell)
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let dest = segue.destinationViewController as? MatchViewController {
            let button = sender as? MatchTableViewCell
            dest.matchNumber = Int((button?.matchNumberLabel.text)!)!
        }

    }
}
