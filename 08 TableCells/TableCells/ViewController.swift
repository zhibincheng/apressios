//
//  ViewController.swift
//  TableCells
//
//  Created by 张晶 on 2018/9/17.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet weak var tableView: UITableView!
    let computers = [
        ["Name":"Macbook Air", "Color":"Sliver"],
        ["Name":"Macbook Pro", "Color":"Sliver"],
        ["Name":"iMac", "Color":"Sliver"],
        ["Name":"Mac Mini", "Color":"Sliver"],
        ["Name":"Mac Pro", "Color":"Black"]
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! NameAndColorViewCell
        
        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NameAndColorViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

