//
//  ProfileRdvSectionCell.swift
//  Beauty App
//
//  Created by User on 1/22/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ProfileRdvHeaderSectionCell: UITableViewCell {

    @IBOutlet weak var salonName: UILabel!
    @IBOutlet weak var salonAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
