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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buynowButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products Details"
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        DetailsManager.detailsManager.getProductDetails()
        collectionView.register(UINib(nibName: "DisplayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DisplayCollectionViewCell")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTapped() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductQuantityViewController") as! ProductQuantityViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
            present(vc, animated: true, completion: nil)
        }
    @IBAction func buynowButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddressListViewController") as? AddressListViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func rateButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductRatingViewController") as! ProductRatingViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }
    
}

extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisplayCollectionViewCell", for: indexPath) as? DisplayCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    
}
