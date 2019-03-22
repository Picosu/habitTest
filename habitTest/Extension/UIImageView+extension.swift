//
//  UIImageView+extension.swift
//  habitTest
//
//  Created by Maxence de Cussac on 22/03/2019.
//  Copyright © 2019 Maxence de Cussac. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    public func imageFromServerURL(urlString: String) {
        
        guard !urlString.isEmpty else {
            return
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}
