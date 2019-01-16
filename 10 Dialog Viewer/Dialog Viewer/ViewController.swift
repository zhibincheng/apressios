//
//  ViewController.swift
//  Dialog Viewer
//
//  Created by 张晶 on 2019/1/3.
//  Copyright © 2019 Apress. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    private var sections:[[String: String]]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = [
            ["header":"First Witch","content":"1Hey,when will the three of us meet up later?"],
            ["header":"Second Witch","content":"2Hey,when will the three of us meet up later?"],
            ["header":"Third Witch","content":"3Hey,when will the three of us meet up later?"],
            ["header":"First Witch","content":"4Hey,when will the three of us meet up later?"],
            ["header":"Second Witch","content":"5Hey,when will the three of us meet up later?"],
            ["header":"Third Witch","content":"6Hey,when will the three of us meet up later?"],
            ["header":"First Witch","content":"7Hey,when will the three of us meet up later?"],
            ["header":"Second Witch","content":"8Hey,when will the three of us meet up later?"],
            ["header":"Third Witch","content":"9Hey,when will the three of us meet up later?"]
            ]
        
        collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
    
        var contentInset = collectionView?.contentInset
        contentInset?.top = 20
        collectionView?.contentInset = contentInset!
        
        let layout = collectionView?.collectionViewLayout
        let flow = layout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 20)
        
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HEADER")
        flow.headerReferenceSize = CGSize(width: 100, height: 25)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionElementKindSectionHeader){
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADER", for: indexPath) as! HeaderCell
            cell.maxWidth = collectionView.bounds.size.width
            cell.text = sections[indexPath.section]["header"]
            return cell
        }
        abort() //终止当前func，类似的还有exit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wordsInSection(section:Int)->[String]{
        let content = sections[section]["content"]
        let spaces = NSCharacterSet.whitespacesAndNewlines
        let words = content?.components(separatedBy: spaces)
        return words!
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let words = wordsInSection(section: section)
        return words.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let words = wordsInSection(section: indexPath.section)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CONTENT", for: indexPath) as! ContentCell
        cell.maxWidth = collectionView.bounds.size.width
        cell.text = words[indexPath.row]
//        print("class = \(cell.classForCoder)")
//        print("text = \(cell.text)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let words = wordsInSection(section: indexPath.section)
        let size = ContentCell.sizeForContentString(s: words[indexPath.row], forMaxWidth: collectionView.bounds.size.width)
//        print("size = \(size.width),\(size.height)")
        return size
    }
}

