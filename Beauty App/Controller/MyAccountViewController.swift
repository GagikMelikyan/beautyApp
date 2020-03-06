//
//  MyAccountViewController.swift
//  Beauty App
//
//  Created by User on 1/25/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func goToBack() {
           navigationController?.popViewController(animated: true)
       }

}
