//
//  FavoritesList.swift
//  Fonts
//
//  Created by 张晶 on 2018/9/19.
//  Copyright © 2018 Apress. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList{
    class var shareFavoriteList : FavoritesList{
        struct Singleton {
            static let instance = FavoritesList()
        }
        return Singleton.instance
    }
    
    private(set) var favorites:[String]
        = []
    
    init(){
        let defaults = UserDefaults.standard
        let storeFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storeFavorites != nil ? storeFavorites! : []
    }
    
    func addFavorite(fontName: String){
        if(!favorites.contains(fontName)){
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName:String){
        if let index = favorites.index(of: fontName){
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites(){
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int){
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
}
