//
//  ProductListViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var productsListViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
        

//        productsListViewModel.fetchProducts { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success:
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .failure(let error):
//                print("Failed to fetch products: \(error.localizedDescription)")
//            }
//        }
    }
    
   func setUpView(){
        self.title = "Products"
        // navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
}
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return productsListViewModel.getCount()
        return 7
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell") as? ProductListTableViewCell
//        let product = productsListViewModel.products[indexPath.row]
//        cell?.productname.text = product.name
//
//        let imageString = product.product_images
//            if let image = UIImage(named: imageString){
//                cell?.productImage.image = image
//            }
//
//        cell?.productCost.text = "Rs \(String(product.cost))"
//        cell?.productManufacturer.text = product.producer
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as! RatingCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    
}

