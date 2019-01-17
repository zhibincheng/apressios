//
//  ViewController.swift
//  LocalizeMe
//
//  Created by 张晶 on 2019/1/17.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var localeLabel : UILabel!
    @IBOutlet var flagImageView : UIImageView!
    @IBOutlet var labels : [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        labels[0].text = "DDDDDDasdasd asldasljkdjakls asdljkasdljkdsajlk"
//        labels[1].text = "DDDDDDasdasd asldasljkdjakls asdljkasdljkdsajlk"
//        labels[2].text = "DDDDDDasdasdasldasljkdjakls"
//        labels[3].text = "DDDDDDasdasdasldasljkdjakls"
//        labels[4].text = "DDDDDDasd"
        
        let locale = Locale.current //代表用户当前区域设置的Local实例，包含了用户的语言和地区首选项
        _ = Locale.preferredLanguages[0]
        let displayLang = locale.languageCode
        let capitalized = displayLang?.capitalized(with: locale) //遵守当地语言习惯来决定是否大小写
        localeLabel.text = capitalized

        labels[0].text = NSLocalizedString("LABEL_ONE", comment: "The number 1")
        labels[1].text = NSLocalizedString("LABEL_TWO", comment: "The number 2")
        labels[2].text = NSLocalizedString("LABEL_THREE", comment: "The number 3")
        labels[3].text = NSLocalizedString("LABEL_FOUR", comment: "The number 4")
        labels[4].text = NSLocalizedString("LABEL_FIVE", comment: "The number 5")

        let flagFile = NSLocalizedString("FLAG_FILE", comment: "Name of the flag")
        flagImageView.image = UIImage(named: flagFile)
    }

}

