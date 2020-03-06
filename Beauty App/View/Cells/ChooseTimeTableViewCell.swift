//
//  ChooseTimeTableViewCell.swift
//  Beauty App
//
//  Created by User on 2/3/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

protocol  ChooseTimeTableViewCellDelegate: class {
    func didTimeAndDateselected(time: String, cellIndex: Int?)
}

class ChooseTimeTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, TimeCollectionViewCellDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var chooseTimeTableViewCellDelegate: ChooseTimeTableViewCellDelegate?
    var cellIndex: Int?
    var timeData = ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: TimeCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: TimeCollectionViewCell.id)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.id, for: indexPath as IndexPath) as! TimeCollectionViewCell
        cell.timeButton.setTitle(timeData[indexPath.row], for: .normal)
        cell.delegate = self
        return cell
    }
    
    func didChooseTime(time: String) {
        chooseTimeTableViewCellDelegate?.didTimeAndDateselected(time: time, cellIndex: cellIndex)
//        cellIndex = nil
    }
}
