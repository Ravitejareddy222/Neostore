//
//  SofaListViewController.swift
//  NeoProductApp
//
//  Created by Neo on 18/07/24.
//

import UIKit

class SofaListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var productsListViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableViewSetUp()
        getList()
    }
    func getList(){
        productsListViewModel.fetchProducts(product_category_id: 3) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch products: \(error.localizedDescription)")
            }
        }
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
    }
    
   func setUpView(){
        self.title = "Sofas"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
    }

}
extension SofaListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsListViewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell
        
        var product = productsListViewModel.products[indexPath.row]
        cell?.productname.text = product.name

        let imageString = product.product_images
            if let image = UIImage(named: imageString){
                cell?.productImage.image = image
            }

        cell?.productCost.text = "Rs \(String(product.cost))"
        cell?.productManufacturer.text = product.producer
        
        return cell ?? UITableViewCell()
    }
    
    
}
