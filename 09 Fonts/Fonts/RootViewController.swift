//
//  RootViewController.swift
//  Fonts
//
//  Created by 张晶 on 2018/9/19.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    private var familyNames:[String]! //所有要显示的字体列表
    private var cellPointSize : CGFloat! //在表视图中使用的字体大小
    private var favoritesList:FavoritesList! //单例指针
    private let familyCell = "FamilyName" //标识符常量
    private let favoritesCell = "Favorites"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let listVC = segue.destination as! FontListViewController
        
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            listVC.fontNames = (UIFont.fontNames(forFamilyName: familyName)).sorted()
            listVC.navigationItem.title = familyName
            listVC.showsFavorites = false
        } else {
            listVC.fontNames = favoritesList.favorites
            listVC.navigationItem.title = "Favorites"
            listVC.showsFavorites = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        familyNames = (UIFont.familyNames as [String]).sorted()
        let preferrenTableViewFont = UIFont.preferredFont(forTextStyle: .headline)
        cellPointSize = preferrenTableViewFont.pointSize
        favoritesList = FavoritesList.shareFavoriteList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() //每次回来都更新数据
    }
    
    func fontForDisplay(atIndexPath indexPath:NSIndexPath) -> UIFont? {
        if indexPath.section == 0{
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNames(forFamilyName: familyName).first
            if(fontName == nil){
                //虽然还不知道为什么会有nil，但是这里就容错了，书上没有这段
                return nil
            }else{
                let theFN =  fontName as String?
                return UIFont(name: theFN!, size: cellPointSize)
            }
        } else {
            return nil
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return favoritesList.favorites.isEmpty ? 1 : 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? familyNames.count : 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: familyCell, for: indexPath) as UITableViewCell
            cell.textLabel?.font = fontForDisplay(atIndexPath:indexPath as NSIndexPath)
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
        } else {
            return tableView.dequeueReusableCell(withIdentifier: familyCell, for: indexPath) as UITableViewCell
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
