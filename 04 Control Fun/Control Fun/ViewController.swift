//
//  ViewController.swift
//  Control Fun
//
//  Created by 张晶 on 2018/9/2.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderLabel.text = "50"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(_ sender: UITextField){
        sender.resignFirstResponder()
        
    }

    @IBAction func backgroundTap(_ sender: UIControl){
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
        
    }
    @IBAction func sliderChange(_ sender: UISlider) {
        let progress = lround(Double(sender.value))
        sliderLabel.text = "\(progress)"
    }
}

