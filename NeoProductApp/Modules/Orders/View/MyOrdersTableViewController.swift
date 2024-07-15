//
//  MyOrdersTableViewController.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit

class MyOrdersTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Orders"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyOrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "MyOrdersTableViewCell")
        
    }
}

extension MyOrdersTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrdersTableViewCell") as?  MyOrdersTableViewCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "OrdersStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "OrderIDTableViewController") as? OrderIDTableViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
