//
//  FirstViewController.swift
//  BridgeControl
//
//  Created by 张晶 on 2019/1/6.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var officerLabel:UILabel!
    @IBOutlet var authorizationCodeLabel:UILabel!
    @IBOutlet var rankLabel:UILabel!
    @IBOutlet var warpDriveLabel:UILabel!
    @IBOutlet var warpFactorLabel:UILabel!
    @IBOutlet var favoriteTeaLabel:UILabel!
    @IBOutlet var favoriteCaptainLabel:UILabel!
    @IBOutlet var favoriteGadgetLabel:UILabel!
    @IBOutlet var favoriteAlienLabel:UILabel!
    
    
    func refreshFields() {
        let defaults = UserDefaults.standard
        officerLabel.text = defaults.string(forKey: officerKey)
        authorizationCodeLabel.text = defaults.string(forKey: authorizationCodeKey)
        rankLabel.text = defaults.string(forKey: rankKey)
        warpDriveLabel.text = defaults.bool(forKey: warpDriveKey) ? "Engaged" : "Disabled"
        warpFactorLabel.text = (defaults.object(forKey: warpFactorKey) as AnyObject).stringValue
        favoriteTeaLabel.text = defaults.string(forKey: favoriteTeaKey)
        favoriteCaptainLabel.text = defaults.string(forKey: favoriteCaptainKey)
        favoriteGadgetLabel.text = defaults.string(forKey: favoriteGadgetKey)
        favoriteAlienLabel.text = defaults.string(forKey: favoriteAlienKey)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        
//        let app = UIApplication.shared
//        NotificationCenter.default.addObserver(self,
//                                                         selector: "applicationWillEnterForeground:",
//                                                         name: NSNotification.Name.UIApplicationWillEnterForeground,
//                                                         object: app)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

