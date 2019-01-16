//
//  ViewController.swift
//  State Lab
//
//  Created by 张晶 on 2019/1/7.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var label:UILabel!
    private var smiley:UIImage!
    private var smileyView:UIImageView!
    private var segmentedControl:UISegmentedControl!
    private var index = 0
    private var animate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = view.bounds
        let labelFrame = CGRect(x: bounds.origin.x,
                                y: bounds.midY - 50, width: bounds.size.width, height: 100)
        label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "Helvetica", size:70)
        label.text = "Bazinga!"
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        
        // smiley.png is 84 x 84
        let smileyFrame = CGRect(x: bounds.midX - 42,
                                 y: bounds.midY/2 - 42, width: 84, height: 84)

        smileyView = UIImageView(frame:smileyFrame)
        smileyView.contentMode = UIViewContentMode.center
        let smileyPath =
            Bundle.main.path(forResource: "smiley", ofType: "png")!
        smiley = UIImage(contentsOfFile: smileyPath)
        smileyView.image = smiley
        segmentedControl =
            UISegmentedControl(items: ["One","Two", "Three", "Four"])
        segmentedControl.frame = CGRect(x: bounds.origin.x + 20, y: 50,
                                        width: bounds.size.width - 40, height: 30)
        segmentedControl.addTarget(self, action: #selector(selectionChanged),
                                   for: UIControlEvents.valueChanged)

        view.addSubview(segmentedControl)
        view.addSubview(smileyView)

        view.addSubview(label)

        index = UserDefaults.standard.integer(forKey: "index")
        segmentedControl.selectedSegmentIndex = index;

        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(applicationWillResignActive),
                           name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        center.addObserver(self, selector: #selector(ViewController.applicationDidBecomeActive),
                           name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        center.addObserver(self, selector: #selector(ViewController.applicationDidEnterBackground),
                           name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        center.addObserver(self, selector: #selector(ViewController.applicationWillEnterForeground),
                           name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)

    }
    
    
    func rotateLabelDown() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
        },
                       completion: {(Bool) -> Void in
                        self.rotateLabelUp()
        }
        )
    }
    
    func rotateLabelUp() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: 0)
        },
                       completion: {(Bool) -> Void in
                        if self.animate {
                            self.rotateLabelDown()
                        }
        }
        )
    }
    
    @objc func applicationWillResignActive() {
        print("VC: \(#function)")
        animate = false
    }
    
    @objc func applicationDidBecomeActive() {
        print("VC: \(#function)")
        animate = true
        rotateLabelDown()
    }
    
    @objc func applicationDidEnterBackground() {
        print("VC: \(#function)")
        UserDefaults.standard.set(self.index, forKey:"index")
        
        let app = UIApplication.shared
        var taskId = UIBackgroundTaskInvalid //先让这个ID是失败
        let id = app.beginBackgroundTask() { //告诉系统，我要在后台执行一些任务
            print("Background task ran out of time and was terminated.")
            app.endBackgroundTask(taskId) //告诉系统，任务执行完了，但为什么这里不是id，而是taskId呢
        }
        taskId = id //如果失败的化，id还是会被系统返回成UIBackgroundTaskInvalid，否则，会是一个需要返回给系统的id
        
        if taskId == UIBackgroundTaskInvalid {
            print("Failed to start background task!")
            return
        }
        
        DispatchQueue.global(qos: .default).async {
            print("Starting background task with " +
                "\(app.backgroundTimeRemaining) seconds remaining")
            
            self.smiley = nil;
            self.smileyView.image = nil;
            
            // simulate a lengthy (25 seconds) procedure
            Thread.sleep(forTimeInterval: 25)
            
            print("Finishing background task with " +
                "\(app.backgroundTimeRemaining) seconds remaining")
            app.endBackgroundTask(taskId)
        }
    }
    
    @objc func applicationWillEnterForeground() {
        print("VC: \(#function)")
        let smileyPath =
            Bundle.main.path(forResource: "smiley", ofType:"png")!
        smiley = UIImage(contentsOfFile: smileyPath)
        smileyView.image = smiley
    }
    
    @objc func selectionChanged(_ sender:UISegmentedControl) {
        index = segmentedControl.selectedSegmentIndex;
    }


}

