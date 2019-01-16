//
//  NameAndColorCell.swift
//  TableCells
//
//  Created by 张晶 on 2018/9/17.
//  Copyright © 2018 Apress. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {

    var name:String = ""{
        didSet{
            if (name != oldValue){
                nameLabel.text = name
            }
        }
    }
    var color:String = ""{
        didSet{
            if(color != oldValue){
                colorLabel.text = color
            }
        }
    }
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var colorLabel:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
