//
//  MatchTableViewCell.swift
//  Tests
//
//  Created by Samuel Resendez on 1/16/16.
//  Copyright © 2016 Samuel Resendez. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var redThreeLabel: UILabel!
    @IBOutlet weak var redTwoLabel: UILabel!
    @IBOutlet weak var matchNumberLabel: UILabel!
    @IBOutlet weak var redScoreLabel: UILabel!
    @IBOutlet weak var blueTwoLabel: UILabel!
    @IBOutlet weak var blueScoreLabel: UILabel!
    @IBOutlet weak var blueOneLabel: UILabel!
    @IBOutlet weak var blueThreeLabel: UILabel!
    
    @IBOutlet weak var redOneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
