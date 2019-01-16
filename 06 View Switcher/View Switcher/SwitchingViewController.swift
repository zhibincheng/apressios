//
//  ViewController.swift
//  View Switcher
//
//  Created by 张晶 on 2018/9/7.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {

    private var blueViewController:BlueViewController!
    private var yellowViewController:YellowViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue")) as! BlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil,to: blueViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?){
        if fromVC != nil{
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
        
    }

    @IBAction func switchViews(_ sender:UIBarButtonItem) {
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil{
                yellowViewController = (storyboard?.instantiateViewController(withIdentifier: "Yellow")) as! YellowViewController
            }
        }else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue")) as! BlueViewController
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if blueViewController != nil && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController, to: blueViewController)
        }
        
        UIView.commitAnimations()

    }

}

