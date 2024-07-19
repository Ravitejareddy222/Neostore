//
//  ProductDetailsViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productManufacturerLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buynowButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    
    var id = 1
    var categoryId = 1
    
    var productDetailsViewModel = ProductDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewsetUp()
        getDetails()
        
    }
    
    func getDetails(){
        productDetailsViewModel.getProductDetails(product_id: id) {[weak self] error in
            guard let self = self else {return}
            
            if let error = error {
                print("Failed to fetch products: \(error.localizedDescription)")
            } else{
                DispatchQueue.main.async{
                    self.displayData()
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func displayData(){
        guard let  productDetails = productDetailsViewModel.productDetails else{
            return
        }
        let cost = productDetails.cost
        productCostLabel.text = "Rs \(cost)"
        productNameLabel.text = productDetails.name
        productManufacturerLabel.text = productDetails.producer
        productDescriptionLabel.text = productDetails.description
        productCategoryLabel.text = productDetailsViewModel.getProductCategoryName()
        let productImage = productDetailsViewModel.productDetails?.product_images[0]
        if let imageUrl = productImage?.image{
            imageView.sd_setImage(with: imageUrl)
        }
    }
    
    func collectionViewsetUp(){
        self.title = "Products Details"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        collectionView.delegate = self
        collectionView.dataSource = self
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
        return productDetailsViewModel.productDetails?.product_images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisplayCollectionViewCell", for: indexPath) as? DisplayCollectionViewCell
        
        cell?.pageControl.isHidden = true
        let productImage = productDetailsViewModel.productDetails?.product_images[indexPath.row]
        if let imageUrl = productImage?.image{
            cell?.diaplayImage.sd_setImage(with: imageUrl) 
        }

        return cell ?? UICollectionViewCell()
    }
    
    
}
