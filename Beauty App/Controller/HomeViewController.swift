//
//  ViewController.swift
//  Beauty App
//
//  Created by User on 1/17/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func bb() {
        print("Planity")
    }
    
    @IBAction func goToResults() {
        let resultsVC = storyboard?.instantiateViewController(withIdentifier: ResultsViewController.id) as! ResultsViewController
        navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    @IBAction func goToMyAccount() {
        let vc = storyboard?.instantiateViewController(withIdentifier: MyAccountViewController.id) as! MyAccountViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}





