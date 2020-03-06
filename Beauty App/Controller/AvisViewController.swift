//
//  PrendreRdvViewController.swift
//  Beauty App
//
//  Created by User on 1/23/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class AvisViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [Data(opened: false, title: "Femme : Coupe", sectionData: []),
                Data(opened: false, title: "Femme : Coupe", sectionData: []),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: []),
                Data(opened: false, title: "Femme : Coupe", sectionData: []),
                Data(opened: false, title: "Femme : Coupe", sectionData: []),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: [])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCells(names: [AvisSectionCell.id, AvisHeadersSectionCell.id, AvisTableViewCell.id])
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].sectionData.count + 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        let sectionIndex = indexPath.section - 1
        
        if indexPath.row == 0 {
            
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: AvisHeadersSectionCell.id, for: indexPath) as! AvisHeadersSectionCell
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: AvisSectionCell.id, for: indexPath) as! AvisSectionCell
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AvisTableViewCell.id, for: indexPath) as! AvisTableViewCell
            return cell
        }
    }
    
    
    
}
