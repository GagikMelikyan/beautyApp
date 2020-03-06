//
//  ProfileViewController.swift
//  Beauty App
//
//  Created by User on 1/21/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var rdvView: UIView!
    @IBOutlet weak var avisView: UIView!
    @IBOutlet weak var proposView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.addUnderlineForSelectedSegment()
    }
    
    @IBAction func didChangeSegmentedControl(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.rdvView.alpha = 1;
            self.avisView.alpha = 0;
            self.proposView.alpha = 0;
        case 1:
            self.rdvView.alpha = 0;
            self.avisView.alpha = 1;
            self.proposView.alpha = 0;
        case 2:
            self.rdvView.alpha = 0;
            self.avisView.alpha = 0;
            self.proposView.alpha = 1;
        default:
            return
        }
    }
    
   
    @IBAction func goToBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
