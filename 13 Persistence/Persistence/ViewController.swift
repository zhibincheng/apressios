//
//  ViewController.swift
//  Persistence
//
//  Created by 张晶 on 2019/1/6.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lineFields:[UITextField]!
    
    //获取存取文件的path
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.appendingPathComponent("data.plist") as String
    }
    
    @objc func applicationWillResignActive(notification:NSNotification) {
        let filePath = self.dataFilePath()
        let array = (self.lineFields as NSArray).value(forKey: "text") as! NSArray
        array.write(toFile: filePath, atomically: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取文件路径
        let filePath = self.dataFilePath()
        if (FileManager.default.fileExists(atPath: filePath)) { //检测一下数据文件是否存在
            //把路径目标的文件里面内容读出来，读到数组里
            let array = NSArray(contentsOfFile: filePath) as! [String]
            //按顺序给textfield赋值
            for i in 0..<array.count {
                lineFields[i].text = array[i]
            }
        }
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(applicationWillResignActive),
            name: NSNotification.Name.UIApplicationWillResignActive,
            object: app)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

