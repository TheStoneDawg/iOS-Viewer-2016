//
//  FirebaseDataFetcher.swift
//  Tests
//
//  Created by Samuel Resendez on 1/14/16.
//  Copyright © 2016 Samuel Resendez. All rights reserved.
//

import UIKit
import Firebase

class FirebaseDataFetcher: NSObject {
    
    var teamList = [String?]()
    var matchList = [String?]()
    
    let rootReference = Firebase(url:"https://1678-dev-2016.firebaseio.com/")
    
    func login(email:String, password:String) {
        rootReference.createUser(email, password: password,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    print(error.description)
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                }
        })
        rootReference.authUser(email, password: password,
            withCompletionBlock: { error, authData in
                if error != nil {
                    print(error)
                } else {
                    print("Success!")
                    print(self.rootReference.authData.auth)
                    print(self.rootReference.authData.uid)
                    self.pullTeamList()
                }
        })
    }
    func pullTeamList() -> [String?] {
        print("We're here")
        rootReference.observeEventType(.Value, withBlock: { snapshot in
            self.teamList.removeAll()
            for child in snapshot.childSnapshotForPath("Teams").children {
                print(child.key!)
                self.teamList.append(child.key)
                print(self.teamList)
            }
            
            }, withCancelBlock: { error in
                print(error.debugDescription)
        })
        return teamList
    }
    func getMatches() -> [String?] {
        var matches = [String?]()
        rootReference.observeEventType(.Value, withBlock: { snapshot in
            for child in snapshot.childSnapshotForPath("Matches").children {
                matches.append(child.key)
            }
        })
        return matches
    }
        
}
    