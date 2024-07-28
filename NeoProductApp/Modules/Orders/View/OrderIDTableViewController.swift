//
//  OrderIDTableViewController.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit
import SDWebImage

class OrderIDTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var orderId: Int = 0
    var viewModel = OrderDetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        getOrderDetails()
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OrderIDTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderIDTableViewCell")
        tableView.register(UINib(nibName: "TotalPriceTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalPriceTableViewCell")
        print(orderId)
    }
    
    func getOrderDetails(){
        viewModel.getOrderDetails(orderId: orderId){ [weak self] error in
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
extension OrderIDTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let total = viewModel.getTotalCount()
        if indexPath.row == total-1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceTableViewCell") as?  TotalPriceTableViewCell
            cell?.totalCost.text = "₹ \(viewModel.getOrderTotalCost())"
            return cell ?? UITableViewCell()
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderIDTableViewCell") as?  OrderIDTableViewCell
            let displayimage = viewModel.getProductImage(item: indexPath.row)
            let imageUrl = URL(string:displayimage)
            cell?.productImage.sd_setImage(with: imageUrl)
            cell?.productNameLabel.text = viewModel.getProductName(item: indexPath.row)
            cell?.productCategoryLabel.text = "(\(viewModel.getProductCategory(item: indexPath.row)))"
            cell?.quantityLabel.text = " QTY : \(String(viewModel.getProductQuantity(item: indexPath.row)))"
            cell?.productCostLabel.text = "₹ \(String(viewModel.getProductCost(item: indexPath.row)))"

            return cell ?? UITableViewCell()
        }
        return  UITableViewCell()
        
    }
}
