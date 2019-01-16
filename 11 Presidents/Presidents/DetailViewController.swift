//
//  DetailViewController.swift
//  Presidents
//
//  Created by 张晶 on 2019/1/4.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView:UIWebView!

    private var languageButton:UIBarButtonItem?
    private var languagePopoverController:UIPopoverPresentationController?//UIPopoverController?
    
    var languageString: String = "" {
        didSet {
            if (languageString != oldValue) {
                configureView()
            }
        }
    }
    
    private func modifyUrlForLanguage(url:String,language lang:String?) -> String{
        var newUrl = url
        if let langStr = lang{
            let range = NSMakeRange(7,2)
            if !langStr.isEmpty && (url as NSString).substring(with: range) != langStr{
                newUrl = "http://www.baidu.com" //实际代码在P264
            }
        }
        newUrl = "http://www.baidu.com"
        return newUrl
    }
    
    func configureView() {
        // 更新detailItem的UI
        //if let的主要作用，就是在{}里面，不再需要解包了。
        if let detail:AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                let dict = detail as! [String:String]
                let urlString = modifyUrlForLanguage(url: dict["url"]!, language: languageString)
                
//                let urlString = dict["url"]!
                label.text = urlString
                
                let url = URL(string:urlString)!
                let request = URLRequest(url:url)
                webView.loadRequest(request)
                
                let name = dict["name"]!
                title = name
                
//                label.text = "这就是：\(detail.description)" //description是NSObject子类自己实现的，恰好NSDate的Description是返回时间与日期
            }
        }
    }
    
    var detailItem: AnyObject? {
        //当detailItem的值每次变动时，都会调用didSet
        didSet {
            // 更新view
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice.current.userInterfaceIdiom == .pad {
            languageButton = UIBarButtonItem(title: "Choose Language", style: .plain, target: self, action: #selector(toggleLanguagePopover))
            navigationItem.rightBarButtonItem = languageButton
        }
        configureView() //视图被加载时就调用一次
    }
    
    //这个方法可是费了好大劲搞定的啊
    @objc func toggleLanguagePopover(){
        let pop = LanguageListController()
        pop.modalPresentationStyle = .popover
        pop.popoverPresentationController?.delegate = self
        pop.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem;
        pop.popoverPresentationController?.permittedArrowDirections = .up
        pop.preferredContentSize = CGSize(width: 200, height: 300)
        self.present(pop, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    


}

