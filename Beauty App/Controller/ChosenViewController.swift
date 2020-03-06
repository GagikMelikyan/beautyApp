//
//  ChosenViewController.swift
//  Beauty App
//
//  Created by User on 1/29/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ChosenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MastersViewControllerDelegate, ChooseTimeTableViewCellDelegate {
        
    @IBOutlet weak var dateAndTimeTableView: UITableView!
    @IBOutlet weak var dateAndTimeTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var chooseMasterView: UIView!
    @IBOutlet weak var choosedMasterLabel: UILabel!
    
    var data = [Data(opened: false, title: "Femme : Coupe", sectionData: ["Jeudi 16 janvier"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["Vendredi 17 janvier"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["Samedi 18 janvier"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["Lundi 20 janvier"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["Mardi 21 janvier"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["Mercredi 22 janvier"]),
                Data(opened: false, title: "Femme : Coupe", sectionData: ["Jeudi 23 janvier"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateAndTimeTableView.registerCells(names: [ChooseTimeTableViewCell.id, ChooseDateSectionCell.id])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        chooseMasterView.addGestureRecognizer(tap)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].opened {
            return data[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        let sectionIndex = indexPath.section - 1
        
        if tableView === dateAndTimeTableView {
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: ChooseDateSectionCell.id, for: indexPath) as! ChooseDateSectionCell
                cell.choosedDay.text = data[indexPath.section].sectionData.first  //change after api
                
                switch data[indexPath.section].opened {
                case true:
                    cell.arrowImage.transform = CGAffineTransform(rotationAngle: (180 * CGFloat(Double.pi)) / 180.0)
                default:
                    cell.arrowImage.transform = CGAffineTransform(rotationAngle: (0 * CGFloat(Double.pi)) / 180.0)
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: ChooseTimeTableViewCell.id, for: indexPath) as! ChooseTimeTableViewCell
                cell.cellIndex = indexPath.section    // Delete
                cell.chooseTimeTableViewCellDelegate = self
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.id, for: indexPath) as! MasterTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        if indexPath.row == 0 /*&& indexPath.section != 0 */ {
            
            if data[indexPath.section].opened {
                data[indexPath.section].opened = false
                self.dateAndTimeTableViewHeightConstraint.constant -= 215
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
                
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            } else {
                data[indexPath.section].opened = true
                print(data[indexPath.row].sectionData)
                self.dateAndTimeTableViewHeightConstraint.constant += 215
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
                
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            }
        }
    }
    
    //MARK: ACTIONS
    @IBAction func goToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: MastersViewController.id) as! MastersViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: MastersViewControllerDelegate
    func didSelectMaster(name: String) {

        choosedMasterLabel.text = name
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: ChooseTimeTableViewCellDelegate
    func didTimeAndDateselected(time: String, cellIndex: Int?) {
        let vc = storyboard?.instantiateViewController(identifier: OrderVerificationViewController.id) as! OrderVerificationViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.orderDateTime = " \(data[cellIndex!].sectionData.first ?? "") 2020 à \(time)"
//        print(time, data[cellIndex!].sectionData)  // delete
    }
}

