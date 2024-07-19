//
//  CupboardListViewController.swift
//  NeoProductApp
//
//  Created by Neo on 18/07/24.
//

import UIKit

class CupboardListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var productsListViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableViewSetUp()
        getList()
    }
    func getList() {
        productsListViewModel.fetchProducts(product_category_id: 4) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                print("Failed to fetch products: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
    }
    
   func setUpView(){
        self.title = "Cupboards"
       
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension CupboardListViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        
        let product = productsListViewModel.products[indexPath.row]
        vc?.id = product.id
        navigationController?.pushViewController(vc!, animated: true)
    }
}

