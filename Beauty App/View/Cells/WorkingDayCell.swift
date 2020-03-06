//
//  WorkingDayCell.swift
//  Beauty App
//
//  Created by User on 1/24/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class WorkingDayCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var workingTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
