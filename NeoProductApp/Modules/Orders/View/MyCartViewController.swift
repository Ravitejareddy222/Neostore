//
//  MyCartViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class MyCartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var total = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OrderIDTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderIDTableViewCell")
        tableView.register(UINib(nibName: "TotalPriceTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalPriceTableViewCell")
        tableView.register(UINib(nibName: "EditButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "EditButtonTableViewCell")
    }
}

extension MyCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == total-2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceTableViewCell") as?  TotalPriceTableViewCell
            return cell ?? UITableViewCell()
        } else if indexPath.row == total-1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditButtonTableViewCell") as?  EditButtonTableViewCell
            
            if let button = cell?.editButton {
                button.backgroundColor = UIColor(named: "customred")
                button.tintColor = UIColor(named: "customWhite")
                button.setTitle("ORDER NOW", for: .normal)
                button.layer.cornerRadius = 10
                button.layer.masksToBounds = true
            }
            return cell ?? UITableViewCell()
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderIDTableViewCell") as?  OrderIDTableViewCell
            return cell ?? UITableViewCell()
        }
        return  UITableViewCell()
        
    }
}
