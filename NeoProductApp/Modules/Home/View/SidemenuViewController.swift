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
    
    var menuList = ["MyCart", "Tables", "Chairs", "Sofas", "Cupboards", "My Account", "Store Locator", "My Orders", "Logout" ]
    var menuImages = ["mycart", "table", "sofa", "chair", "cupboard", "personr", "storelocator", "orders", "logout"]
    
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
        cell?.leftImageIcon.image = UIImage(named: menuList[item])
        cell?.leftImageIcon.tintColor = .white
        
//        if let image = UIImage(named: menuList[item]) {
//                cell?.leftImageIcon.image = image.withRenderingMode(.alwaysTemplate)
//                cell?.leftImageIcon.tintColor = .white
//            } else {
//                cell?.leftImageIcon.image = nil
//            }
                                    
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "OrdersStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MyCartViewController") as? MyCartViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
        if indexPath.row == 5 {
            let storyboard = UIStoryboard(name: "MyAccountStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MyAccountViewController") as? MyAccountViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "ProductStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "ProductStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
        if indexPath.row == 7 {
            let storyboard = UIStoryboard(name: "OrdersStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MyOrdersTableViewController") as? MyOrdersTableViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
        if indexPath.row == 8 {
            let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "AddressListViewController") as? AddressListViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
   
    
}
