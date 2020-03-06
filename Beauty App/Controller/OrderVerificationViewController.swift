//
//  OrderVerificationViewController.swift
//  Beauty App
//
//  Created by User on 2/5/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit
import NKVPhonePicker

class OrderVerificationViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var orderDateTimeLabel: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var regView: UIView!
    @IBOutlet weak var loginViewHeightConstraint: NSLayoutConstraint! // 286
    @IBOutlet weak var regViuwHeightConstraint: NSLayoutConstraint! // 456
    @IBOutlet weak var regCheckboxButton: UIButton!
    @IBOutlet weak var goTRegView: UIView!
    @IBOutlet weak var goToLoginView: UIView!
    @IBOutlet weak var gotoRegViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var goToLoginViewheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneTextField: NKVPhonePickerTextField!
    
    var orderDateTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        regViuwHeightConstraint.constant = 0
        regView.isHidden = true
        
        goToLoginViewheightConstraint.constant = 0
        goToLoginView.isHidden = true
        phoneTextField.phonePickerDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.layoutIfNeeded()
        self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 300.0), animated: true)
        
        orderDateTimeLabel.text = orderDateTime
    }
    
    @IBAction func changeLogToRegView() {
        regViuwHeightConstraint.constant = 456
        regView.isHidden = false
        
        goTRegView.isHidden = true
        gotoRegViewHeightConstraint.constant = 0
        goToLoginViewheightConstraint.constant = 58
        goToLoginView.isHidden = false
        
        loginViewHeightConstraint.constant = 0
        loginView.isHidden = true
        self.view.layoutIfNeeded()
    }
    
    @IBAction func changeRegToLoginView() {
        regViuwHeightConstraint.constant = 0
        regView.isHidden = true
        
        goToLoginViewheightConstraint.constant = 0
        goToLoginView.isHidden = true
        goTRegView.isHidden = false
        gotoRegViewHeightConstraint.constant = 58
        
        loginViewHeightConstraint.constant = 256
        loginView.isHidden = false
        self.view.layoutIfNeeded()
    }
    
    @IBAction func goToBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func setCheckbox(_ sender: UIButton) {
        
        if (regCheckboxButton.isSelected == true)
        {
            regCheckboxButton.setImage(UIImage(named: "chekbox_off"), for: .normal)
            regCheckboxButton.isSelected = false;
        }
        else
        {
            regCheckboxButton.setImage(UIImage(named: "checkbox_on"), for: .normal)            
            regCheckboxButton.isSelected = true;
        }
    }
    
    
}
