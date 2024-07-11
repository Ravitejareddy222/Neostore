//
//  ProductDetailsViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productManufacturer: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products Details"
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        DetailsManager.detailsManager.getProductDetails()
    }
}

extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsViewCell", for: indexPath) as? ProductDetailsViewCell
        return cell ?? UICollectionViewCell()
    }
    
    
}
