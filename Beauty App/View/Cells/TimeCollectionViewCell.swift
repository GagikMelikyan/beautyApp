//
//  TimeCollectionViewCell.swift
//  Beauty App
//
//  Created by User on 2/3/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

protocol TimeCollectionViewCellDelegate: class {
    func didChooseTime(time: String)
}

class TimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeButton: UIButton!
    
    weak var delegate: TimeCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
   
    @IBAction func selectTime(_ sender: UIButton) {
        delegate?.didChooseTime(time: (sender.titleLabel?.text)!)
    }
    

}
