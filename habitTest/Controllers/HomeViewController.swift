//
//  ViewController.swift
//  habitTest
//
//  Created by Maxence de Cussac on 20/03/2019.
//  Copyright © 2019 Maxence de Cussac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let cellReuseIdentifier = "shopCellReuseIdentifier"

    private var dataSource = [Shop]()

    @IBOutlet weak var shopsTableView: UITableView!
    
    private func loadItems() {
        NetworkManager.retrieveDataFromApi() { (shops) in
            if shops.count != 0 {
                self.dataSource = shops
            }
            DispatchQueue.main.async {
                self.shopsTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
    }


}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ShopTableViewCell else {
            return UITableViewCell()
        }
        cell.shop = dataSource[indexPath.row]
        
        return cell
    }
}

