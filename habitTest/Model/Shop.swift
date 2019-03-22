//
//  Shop.swift
//  habitTest
//
//  Created by Maxence de Cussac on 20/03/2019.
//  Copyright © 2019 Maxence de Cussac. All rights reserved.
//

import Foundation

class Shop: NSObject {
    var id: Int = 0
    var shop_id: Int = 0
    var latitude: Double?
    var lontitude: Double?
    var distance: Double?
    var name: String = ""
    var chain: String?
    var address: String = ""
    var zipCode: Int?
    var city: String?
    var category_id: Int?
    var category_name: String?
    var logo: String?
    var cover: String?
    var maxoffer: Double?
    var currency: String = "EUR"
    
    init(withJson json: GenericJson) {
        if let id = json["id"] as? Int {
            self.id = id
        }
        
        if let shop_id = json["shop_id"] as? Int {
            self.shop_id = shop_id
        }
        
        if let name = json["name"] as? String {
            self.name = name
        }
        
        if let address = json["address"] as? String {
            self.address = address
        }
        
        if let maxoffer = json["maxoffer"] as? Double {
            self.maxoffer = maxoffer
        }

        if let cover = json["cover"] as? String {
            self.cover = cover
        }
    }
}
