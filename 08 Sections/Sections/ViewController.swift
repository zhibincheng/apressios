//
//  ViewController.swift
//  Sections
//
//  Created by 张晶 on 2018/9/17.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    let sectionsTableIdentifier = "SectionsTableIdentifier" //显示基本列表的ID
    var names:[String:[String]]! //由A-Z索引，并且每个下面都还有一个字符串数组
    var keys:[String]! //A-Z的字符串数组
    
    var searchController:UISearchController! //搜索的CTL
    
    @IBOutlet weak var tableView: UITableView! //基本列表
    
    
    //有多少Section，本例中是26个
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    //每个Section里面有多少行？
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    //每个Section的标题是啥
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    //定义每个Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath) as UITableViewCell
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        
        return cell
    }
    
    //列表右边的A-Z的索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        注册Cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        
        //初始化外部数据
        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict?.allKeys as! [String]).sorted()
        
//        添加搜索功能
        let resultsController = SearchResultsController()
        resultsController.names = names
        resultsController.keys = keys
        searchController = UISearchController(searchResultsController: resultsController)
//        设置搜索里的Bar
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
        
//        设置TableView的外观
        tableView.sectionIndexBackgroundColor = UIColor.black
        tableView.sectionIndexTrackingBackgroundColor = UIColor.darkGray
        tableView.sectionIndexColor = UIColor.white
    }



}

