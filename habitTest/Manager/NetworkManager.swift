//
//  NetworkManager.swift
//  habitTest
//
//  Created by Maxence de Cussac on 20/03/2019.
//  Copyright © 2019 Maxence de Cussac. All rights reserved.
//

import Foundation

typealias GenericJson = [String:AnyObject]

/// Domaine de Deezer
public let apiURL = "https://www.leshabitues.fr/testapi/shops"

class NetworkManager: NSObject {
    
    // MARK :- Constantes
    let reuseIdentifierCell = "shop"
    
    // MARK :- Public methods
    /// Method returns 20 items per page
    class func retrieveDataFromApi(callBack: @escaping ([Shop]) -> ()) {
        
        let urlString = apiURL
        
        guard let url = URL(string: urlString) else {
            return;
        }
        let req = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            guard error == nil else {
                print(error ?? "Undefined error")
                return
            }
            if let data = data {
                // Enregistrement des informations en vue d'un mode offline basique.
                let defaults = UserDefaults.standard
                defaults.set(data, forKey: "jsonData")
                callBack(NetworkManager.parseData(dataToParse: data))
            } else {
                print("Trouble retrieving datas")
            }
        }
        
        task.resume()
    }
    
    class func parseData(dataToParse data:Data) -> [Shop] {
        var reposParsed = [Shop]()
        
        do {
            let jsonReceived = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! GenericJson
            if let shops = jsonReceived["results"] as? [GenericJson] {
                for shop in shops {
                    reposParsed.append(Shop(withJson: shop))
                }
            }
            return reposParsed
        } catch {
            print("\terror parsing \(error) \(data)")
        }
        return reposParsed
    }
    
}
