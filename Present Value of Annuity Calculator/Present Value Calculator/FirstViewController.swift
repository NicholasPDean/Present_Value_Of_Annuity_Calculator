//
//  FirstViewController.swift
//  Present Value Calculator
//
//  Created by Nick Dean on 12/10/18.
//  Copyright © 2018 Nicholas Dean. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var AnnualPayout: UITextField!
    @IBOutlet weak var GrowthRate: UITextField!
    @IBOutlet weak var YearstoPayOut: UITextField!
    @IBOutlet var MyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyLabel.isHidden = true
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        
        AnnualPayout.inputAccessoryView = toolBar
        GrowthRate.inputAccessoryView = toolBar
        YearstoPayOut.inputAccessoryView = toolBar
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    @IBAction func MyButton(_ sender: Any) {
        MyLabel.isHidden = false
        let firstValue = Double(AnnualPayout.text!) ?? Double(0)
        let secondValue = (Double(GrowthRate.text!) ?? Double(0)) / Double(100)
        let thirdValue = Double(-1)
        let fifthValue = Double(YearstoPayOut.text!)
        let fourthValue = (fifthValue ?? Double(0)) * thirdValue
        let outputValue = (Double(firstValue) * ((1-pow(Double(1+secondValue),fourthValue)) / Double(secondValue)))
        let displayvalue = String(format:"%.02f", outputValue)
        
        MyLabel.text = "$\(displayvalue)"
    }
    
}

