//
//  MyCartViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit
import SDWebImage

protocol MyCartTableViewCellDelegate: AnyObject{
    func didQuantityChange(quantity: Int, index: Int)
}

class MyCartViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MyCartViewModel()
    var editCartViewModel = EditCartViewModel()
    var deleteCartViewModel = CartDeleteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getCartItems()
        setTitle("My Cart")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCartItems()
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MycartTableViewCell", bundle: nil), forCellReuseIdentifier: "MycartTableViewCell")
        tableView.register(UINib(nibName: "TotalPriceTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalPriceTableViewCell")
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
    }
    
    func getCartItems(){
        viewModel.getCartList(){ [weak self] error in
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
    
    @IBAction func orderNowButtonTapped(_ sender: Any){
        let total = viewModel.getTotalCount()
        if total > 2{
            let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "AddressListViewController") as? AddressListViewController
            navigationController?.pushViewController(vc!, animated: true)
        } else{
            ShowAlert.showAlert(on: self, title: "Error", message: "Add atleast one element to cart")
        }
    }
    
}

extension MyCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let total = viewModel.getTotalCount()
        
        if indexPath.row == total-2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceTableViewCell") as?  TotalPriceTableViewCell
            cell?.totalCost.text = "Rs \(String(viewModel.getCartTotalCost()))"
            return cell ?? UITableViewCell()
        } else if indexPath.row == total-1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as?  ButtonTableViewCell
            cell?.button.addTarget(self, action: #selector(orderNowButtonTapped(_:)), for: .touchUpInside)
            
            //            if let button = cell?.editButton {
            //                button.backgroundColor = UIColor(named: "customred")
            //                button.tintColor = UIColor(named: "customWhite")
            //                button.setTitle("ORDER NOW", for: .normal)
            //                button.layer.cornerRadius = 10
            //                button.layer.masksToBounds = true
            //            }
            return cell ?? UITableViewCell()
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MycartTableViewCell") as?  MycartTableViewCell
            cell?.delegate = self
            cell?.indexPath = indexPath.row
            let displayimage = viewModel.getProductImage(item: indexPath.row)
            let imageUrl = URL(string:displayimage)
            cell?.productImage.sd_setImage(with: imageUrl)
            cell?.productNameLabel.text = viewModel.getProductName(item: indexPath.row)
            cell?.productCategoryLabel.text = "(\(viewModel.getProductCategory(item: indexPath.row)))"
            cell?.quantityTextField.text = String(viewModel.getProductQuantity(item: indexPath.row))
            cell?.productCostLabel.text = "₹\(String(viewModel.getProductCost(item: indexPath.row)))"
            
            return cell ?? UITableViewCell()
        }
        return  UITableViewCell()
        
    }
    @objc func orderNowButtonTapped() {
        let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddressListViewController") as? AddressListViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            self.deleteItem(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        if let deleteImage = UIImage(named: "delete") {
            let resizedImage = deleteImage.resized(to: CGSize(width: 45, height: 45))
            deleteAction.image = resizedImage
        }
        
        deleteAction.backgroundColor = .white
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

    func deleteItem(at indexPath: IndexPath) {
        let index = Int(indexPath.row)
        let productId = viewModel.getProductId(item: index)
        
        viewModel.removeProduct(at: index)
        
        deleteCartViewModel.deleteCart(product_id: productId){ [weak self] error in
            guard let self = self else {return}
            
            if let error = error {
                print("failed to delete:\(error.localizedDescription)")
            } else{
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
}
extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension MyCartViewController: MyCartTableViewCellDelegate{
    
    func didQuantityChange(quantity: Int, index: Int) {
        let productId = viewModel.getProductId(item: index)
        editCartViewModel.editCart(product_id: productId, productQuantity: index) { [weak self] error in
            
            guard let self = self else { return }
            if let error  = error {
                print("failed to edit: \(error.localizedDescription)")
            } else{
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
    
}
