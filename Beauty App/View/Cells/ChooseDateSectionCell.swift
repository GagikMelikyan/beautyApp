//
//  ChooseDateTableViewCell.swift
//  Beauty App
//
//  Created by User on 2/2/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ChooseDateSectionCell: UITableViewCell {

    @IBOutlet weak var choosedDay: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
