//
//  SearchResultsController.swift
//  Sections
//
//  Created by 张晶 on 2018/9/17.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

private let longNameSize = 6
private let shortNamesButtonIndex = 1
private let longNamesButtonIndex = 2

class SearchResultsController: UITableViewController,UISearchResultsUpdating {

    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names:[String:[String]] = [String:[String]]()
    var keys:[String] = []
    var filteredNames: [String] = []

    
    //这个是UISearchResultUpdating协议定义的 //用户每次触碰键盘都会调用一次
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchString = searchController.searchBar.text //从搜索栏里获取用户输入的字符串
        let buttonIndex = searchController.searchBar.selectedScopeButtonIndex //scopebutton就是切换"All", "Short", "Long"那玩意
        filteredNames.removeAll(keepingCapacity: true) //清空fliter里所有数据（为了重新写入）
        
        if !(searchString!.isEmpty) {
//            fliter1(name:name , buttonIndex: buttonIndex, searchString: searchString)
//            这段是简便地定义了一个Func...虽然还有些地方没搞懂，回头学语法时再看吧
            let filter:(String) -> Bool = { name in
                let nameLength = name.count
                if(buttonIndex == shortNamesButtonIndex && nameLength >= longNameSize) || (buttonIndex == longNamesButtonIndex && nameLength < longNameSize){
                    return false
                }

                let range = name.range(of: searchString!,options:NSString.CompareOptions.caseInsensitive)
                return range != nil
            }
            
            for key in keys{
                let namesForKey = names[key]!
                let matches = namesForKey.filter(filter)
                filteredNames += matches
            }
        }
        //这个方法目的只有一个：更新filteredNames数组里的数据
        tableView.reloadData()
        
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
//        注册Cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }

    // MARK: Table View Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier)
        cell!.textLabel?.text = filteredNames[indexPath.row]
        return cell!
        
    }

    

}
