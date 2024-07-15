//
//  MyCartViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class MyCartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OrderIDTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderIDTableViewCell")
    }
}

extension MyCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderIDTableViewCell") as?  OrderIDTableViewCell
        return cell ?? UITableViewCell()
    }
}
