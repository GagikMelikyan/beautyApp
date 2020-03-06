//
//  ResultsListViewController.swift
//  Beauty App
//
//  Created by User on 1/18/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var mapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.addUnderlineForSelectedSegment()        
    }
       
    @IBAction func goToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func segmentedContolDidChange(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
        if (sender.selectedSegmentIndex == 0) {
        
            self.resultsView.alpha = 1;
            self.mapView.alpha = 0;
        } else {
            self.resultsView.alpha = 0;
            self.mapView.alpha = 1;
        }
    }
    
  
}
