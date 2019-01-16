//
//  ViewController.swift
//  Button Fun
//
//  Created by 张晶 on 2018/8/28.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBAction func buttonPress(_ sender: UIButton) {
        let title = sender.currentTitle
        let plainText = "\(title!) button pressed"
        //statusLabel.text = plainText
        let styledText = NSMutableAttributedString(string: plainText)
        let attributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)]
        let nameRange = (plainText as NSString).range(of:title!)
        styledText.setAttributes(attributes, range: nameRange)
        statusLabel.attributedText = styledText
    }
    

}

