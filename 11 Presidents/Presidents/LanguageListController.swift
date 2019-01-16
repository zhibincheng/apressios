//
//  LanguageListController.swift
//  Presidents
//
//  Created by 张晶 on 2019/1/5.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class LanguageListController: UITableViewController {

    //注意这里的weak，在书中261页有详细说明
    weak var detailViewController: DetailViewController? = nil
    private let languageNames:[String] = ["English","French","German","Spanish"]
    private let languageCodes:[String] = ["en","fr","de","es"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearsSelectionOnViewWillAppear = false
        preferredContentSize = CGSize(width: 320, height: CGFloat(languageCodes.count*44))
        //将基本的TableViewCell注册给这个TableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return languageCodes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = languageNames[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailViewController?.languageString = languageCodes[indexPath.row]
    }
}
