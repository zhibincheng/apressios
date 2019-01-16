//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by 张晶 on 2018/9/12.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = ["a","b","c","d","e","g","h"]
    private let breadTypes = ["aa","bb","cc"]
    
    @IBOutlet weak var doublePicker: UIPickerView!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
        
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "You  \(filling) on \(bread) will be right up."
        
        let alert = UIAlertController(title: "Thank you for ORDER", message:message , preferredStyle: .alert)
        let action = UIAlertAction(title: "Great", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert,animated: true,completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
            return breadTypes.count
        }else{
            return fillingTypes.count
        }
    }
    
    //MARK:-
    //MARK: Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == breadComponent{
            return breadTypes[row]
        }else{
            return fillingTypes[row]
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
