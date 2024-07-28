//
//  SidemenuViewController.swift
//  NeoProductApp
//
//  Created by Neo on 12/07/24.
//

import UIKit
import SideMenu

class SidemenuViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var menuList = ["MyCart", "Tables", "Sofas", "Chairs", "Cupboards", "My Account", "Store Locator", "My Orders", "Logout" ]
    var menuImages = ["cart", "table", "sofa", "chair", "cupboard-icon", "person", "locator", "orders", "logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tableView = tableView else {
            print("Error: tableView is not connected")
            return
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "SidemenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SidemenuTableViewCell")
    }
}

extension SidemenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SidemenuTableViewCell") as?  SidemenuTableViewCell
        let item = indexPath.row
        cell?.listLabel.text = menuList[item]
        cell?.backgroundColor = .black
        cell?.listLabel.textColor = .white
        let imageName = menuImages[item]
        cell?.leftImageIcon.image = UIImage(named: imageName)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MyCartViewController") as? MyCartViewController
            navigationController?.pushViewController(vc!, animated: true)
            
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
            navigationController?.pushViewController(vc!, animated: true)
            
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "SofaListViewController") as? SofaListViewController
            navigationController?.pushViewController(vc!, animated: true)
        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ChairsListViewController") as? ChairsListViewController
            navigationController?.pushViewController(vc!, animated: true)
            
        case 4:
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "CupboardListViewController") as? CupboardListViewController
            navigationController?.pushViewController(vc!, animated: true)
        case 5:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MyAccountViewController") as? MyAccountViewController
            navigationController?.pushViewController(vc!, animated: true)
        case 6:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "StoreLocatorViewController") as? StoreLocatorViewController
            navigationController?.pushViewController(vc!, animated: true)
            
        case 7:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MyOrdersTableViewController") as? MyOrdersTableViewController
            navigationController?.pushViewController(vc!, animated: true)
        case 8:
            AccessTokenManager.shared.deleteAccessToken()
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            navigationController?.pushViewController(vc!, animated: true)
            
        default:
            break
        }
    }
}
