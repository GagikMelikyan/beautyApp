//
//  ResultsViewController.swift
//  Beauty App
//
//  Created by User on 1/20/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ResultsListViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCells(names: [ReslutsTableViewCell.id])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReslutsTableViewCell.id, for: indexPath) as! ReslutsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = storyboard?.instantiateViewController(withIdentifier: ProfileViewController.id) as! ProfileViewController
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
