//
//  ProfileRdvCell.swift
//  Beauty App
//
//  Created by User on 1/22/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ProfileRdvSectionCell: UITableViewCell {

    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.arrowImage.transform = CGAffineTransform(rotationAngle: (0 * CGFloat(Double.pi)) / 180.0)
    }



    
    
}
