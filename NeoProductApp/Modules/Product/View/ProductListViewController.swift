//
//  ProductListViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit
import SDWebImage

class ProductListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var productsListViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableViewSetUp()
        getList()
    }
    
    func getList() {
        productsListViewModel.fetchProducts(product_category_id: 1) { [weak self] error in
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
        //collectionView
        
    }
    
   func setUpView(){
       setTitle("Tables")
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsListViewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell
        let ratingCell = tableView.dequeueReusableCell(withIdentifier: "RatingCollectionViewCell") as? RatingCollectionViewCell
        let product = productsListViewModel.products[indexPath.row]
        cell?.productname.text = product.name
        let imageUrl = product.product_images
        cell?.productImage.sd_setImage(with: imageUrl)
        cell?.productCost.text = "Rs \(String(product.cost))"
        cell?.productManufacturer.text = product.producer
        let rating = productsListViewModel.getRatings(item: indexPath.row)
        cell?.configure(rating: rating)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        
        let product = productsListViewModel.products[indexPath.row]
        vc?.id = product.id
        vc?.categoryId = product.product_category_id
        navigationController?.pushViewController(vc!, animated: true)
    }
}


