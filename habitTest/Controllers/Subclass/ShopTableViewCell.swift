//
//  ShopTableViewCell.swift
//  habitTest
//
//  Created by Maxence de Cussac on 20/03/2019.
//  Copyright © 2019 Maxence de Cussac. All rights reserved.
//

import Foundation
import UIKit

class ShopTableViewCell: UITableViewCell {

    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopAddresseLabel: UILabel!
    @IBOutlet weak var shopMaxofferLabel: UILabel!
    
    public var shop: Shop? {
        didSet {
            guard let shop = shop else {
                return
            }
            if let cover = shop.cover {
                shopImageView.imageFromServerURL(urlString: cover)
            }
            shopNameLabel.text = shop.name
            
            let addresseString = "\(shop.address) \n\(shop.zipCode ?? 0) \(shop.city ?? "")"
            if let maxoffer = shop.maxoffer {
                shopMaxofferLabel.text = "\(maxoffer)"
            }
        }
    }
}
