//
//  ViewController.swift
//  Simple Table
//
//  Created by 张晶 on 2018/9/17.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let dwarves = ["UIViewController", "UITableViewDelegate", "UITableViewDataSource", "private", "dwarves", "tableView", "cellForRowAt", "indexPath", "IndexPath", "viewDidLoad", "additional", "Apress", "rights", "张晶"]
    let simpleTableIdentifer = "simpleTableIdentifer"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifer)
        if (cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: simpleTableIdentifer)
        }
        
        let image = UIImage(named: "star")
        cell!.imageView?.image = image
        let hightlightedImage = UIImage(named: "star2")
        cell!.imageView?.highlightedImage = hightlightedImage
        
        if indexPath.row < 7{
            cell!.detailTextLabel?.text = "Mr Disney"
        }else{
            cell!.detailTextLabel?.text = "Mr Tolk"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0{
            return nil
        }else if(indexPath.row % 2 == 0){
            return NSIndexPath(row: indexPath.row + 1, section: indexPath.section) as IndexPath
        }else{
            return indexPath
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(title: "Row Slected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I Did", style: .default, handler: nil)
        controller.addAction(action)
        
        present(controller,animated: true,completion: nil)
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

