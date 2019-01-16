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
    private let rootKey = "rootKey"
    
    //获取存取文件的path
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(
            FileManager.SearchPathDirectory.documentDirectory,
            FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        return documentsDirectory.appendingPathComponent("data.archive") as String
    }
    
    @objc func applicationWillResignActive(notification:NSNotification) {
        let filePath = self.dataFilePath()
        let fourLines = FourLines()
        let array = (self.lineFields as NSArray).value(forKey: "text") as! [String]
        fourLines.lines = array
        
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(fourLines, forKey: rootKey)
        archiver.finishEncoding()
        
        data.write(toFile: filePath, atomically: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取文件路径
        let filePath = self.dataFilePath()
        if (FileManager.default.fileExists(atPath: filePath)) { //检测一下数据文件是否存在
            
            let data = NSMutableData(contentsOfFile: filePath)!
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
            let fourLines = unarchiver.decodeObject(forKey: rootKey) as! FourLines
            unarchiver.finishDecoding()
            
            if let newLines = fourLines.lines {
                for i in 0..<newLines.count {
                    lineFields[i].text = newLines[i]
                }
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

