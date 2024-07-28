//
//  MyOrdersTableViewController.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit

class MyOrdersTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MyOrdersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Orders"
        tableViewSetUp()
        getMyOrders()
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyOrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "MyOrdersTableViewCell")
    }
    
    func getMyOrders(){
        viewModel.getMyOrders(){ [weak self] error in
            guard let self = self else {return}
            
            if let error = error {
                print("failed to list:\(error.localizedDescription)")
            } else{
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension MyOrdersTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTableViewCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrdersTableViewCell") as?  MyOrdersTableViewCell
        cell?.orderDateLabel.text = "Ordered date: \(viewModel.getOrderDate(item: indexPath.row))"
        cell?.orderIDLabel.text = "Order ID: \(String(viewModel.getOrderId(item: indexPath.row)))"
        cell?.orderPrice.text = "₹ \(String(viewModel.getOrderCost(item: indexPath.row)))"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "OrdersStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "OrderIDTableViewController") as? OrderIDTableViewController
        vc?.orderId = viewModel.getOrderId(item: indexPath.row)
        print(viewModel.getOrderId(item: indexPath.row))
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
