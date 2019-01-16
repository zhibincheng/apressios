//
//  YellowViewController.swift
//  View Switcher
//
//  Created by 张晶 on 2018/9/7.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yellowButtonPressed(_ sender:UIButton){
        let alert = UIAlertController(title: "Yellow View Button Pressed", message: "You Press the button on the yellow view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yep, I did", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
