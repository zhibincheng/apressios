//
//  CustomPickerViewController.swift
//  Pickers
//
//  Created by 张晶 on 2018/9/12.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    private var images:[UIImage]!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    private var winSoundID: SystemSoundID = 0
    private var crunchSoundID: SystemSoundID = 0
    
    func showButton(){
        button.isHidden = false
    }
    
    func playWinSound(){
        if winSoundID == 0{
            let soundURL = Bundle.main.url(forResource: "win", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        winLabel.text = "WINNER!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.showButton()
        }
    }
    
    @IBAction func spin(_ sender: UIButton) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal{
                numInRow += 1
            }else{
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 3{
                win = true
            }
        }
        
        if crunchSoundID == 0{
            let soundURL = Bundle.main.url(forResource: "crunch", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &crunchSoundID)
        }
        AudioServicesPlaySystemSound(crunchSoundID)
        
        button.isHidden = true
        winLabel.text = ""
        
        if win{
            playWinSound()
        }else{
            self.showButton()
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        winLabel.text = " "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }


}
