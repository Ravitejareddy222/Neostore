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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var name: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        print(name, email)
        //        emailLabel.text = name
        //        nameLabel.text = email
        
        //        if let email = email {
        //            emailLabel.text = email
        //        }
        //        if let name = name {
        //            nameLabel.text = name
        //        }
    }
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "SidemenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SidemenuTableViewCell")
    }
}

extension SidemenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuItem.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SidemenuTableViewCell") as?  SidemenuTableViewCell
        let item = MenuItem(rawValue: indexPath.row)!
        cell?.listLabel.text = item.title
        cell?.backgroundColor = .black
        cell?.listLabel.textColor = .white
        let imageName = item.imageName
        cell?.leftImageIcon.image = UIImage(named: imageName)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController?
        
        switch indexPath.row {
        case 0:
            vc = storyboard.instantiateViewController(identifier: "MyCartViewController") as? MyCartViewController
        case 1:
            vc = storyboard.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
        case 2:
            vc = storyboard.instantiateViewController(identifier: "SofaListViewController") as? SofaListViewController
        case 3:
            vc = storyboard.instantiateViewController(identifier: "ChairsListViewController") as? ChairsListViewController
        case 4:
            vc = storyboard.instantiateViewController(identifier: "CupboardListViewController") as? CupboardListViewController
        case 5:
            vc = storyboard.instantiateViewController(identifier: "MyAccountViewController") as? MyAccountViewController
        case 6:
            vc = storyboard.instantiateViewController(identifier: "StoreLocatorViewController") as? StoreLocatorViewController
        case 7:
            vc = storyboard.instantiateViewController(identifier: "MyOrdersTableViewController") as? MyOrdersTableViewController
        case 8:
            AccessTokenManager.shared.deleteAccessToken()
            vc = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        default:
            vc = nil
        }
        
        if let viewController = vc {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
