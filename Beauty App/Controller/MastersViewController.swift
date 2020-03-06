//
//  MastersViewController.swift
//  Beauty App
//
//  Created by User on 2/4/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

protocol MastersViewControllerDelegate: class {
    func didSelectMaster(name: String)
}

class MastersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mastersTableView: UITableView!
    
    var mastersData = ["Master 1", "Master 2", "Master 3", "Master 4", "Master 5"]
    weak var delegate: MastersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mastersTableView.registerCells(names: [MasterTableViewCell.id])
    }
    
    //MARK: TABLEVIEW DATASOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mastersData.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.id, for: indexPath) as! MasterTableViewCell
        cell.masterNameLabel.text = mastersData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMaster(name: mastersData[indexPath.row])
    }
    
    
    //MARK: ACTIONS
    @IBAction func gotoBack() {
        navigationController?.popViewController(animated: true)
    }
 

}
