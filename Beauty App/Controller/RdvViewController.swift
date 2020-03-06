//
//  RdvViewController.swift
//  Beauty App
//
//  Created by User on 1/21/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

struct Data {
    var opened: Bool
    var title: String
    var sectionData: [String]
}

class RdvViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [Data(opened: false, title: "Femme : Coupe", sectionData: []),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["A", "B", "HC", "HD", "Hv", "Hv","Hv", "Hd", "Hd"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCells(names: [ProfileRdvCell.id, ProfileRdvSectionCell.id, ProfileRdvHeaderSectionCell.id])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].opened {
            return data[section].sectionData.count + 1
        } else {
            return 1
        }
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
                let cell = tableView.dequeueReusableCell(withIdentifier: ProfileRdvHeaderSectionCell.id, for: indexPath) as! ProfileRdvHeaderSectionCell
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: ProfileRdvSectionCell.id, for: indexPath) as! ProfileRdvSectionCell
                
                switch data[indexPath.section].opened {
                case true:
                    cell.arrowImage.transform = CGAffineTransform(rotationAngle: (180 * CGFloat(Double.pi)) / 180.0)
                default:
                    cell.arrowImage.transform = CGAffineTransform(rotationAngle: (0 * CGFloat(Double.pi)) / 180.0)
                }
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileRdvCell.id, for: indexPath) as! ProfileRdvCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 && indexPath.section != 0 {
            
            if data[indexPath.section].opened {
                data[indexPath.section].opened = false
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            } else {
                data[indexPath.section].opened = true
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            }
        } else {
            let chosenVC = storyboard?.instantiateViewController(withIdentifier: ChosenViewController.id) as! ChosenViewController
            navigationController?.pushViewController(chosenVC, animated: true)
        }
    }
    
    
}
