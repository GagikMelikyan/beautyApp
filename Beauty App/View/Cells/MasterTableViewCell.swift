//
//  MasterTableViewCell.swift
//  Beauty App
//
//  Created by User on 2/3/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
   
    @IBOutlet weak var masterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
