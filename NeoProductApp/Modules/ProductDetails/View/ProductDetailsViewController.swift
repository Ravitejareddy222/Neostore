//
//  ProductDetailsViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit
import SDWebImage
import IQKeyboardManagerSwift


class ProductDetailsViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productManufacturerLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var productRatingCollectionView: UICollectionView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buynowButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    
    var id = 1
    var categoryId = 1
    var productQuantity = 0
    var ratings: Int = 0
    
    var productDetailsViewModel = ProductDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewsetUp()
        getDetails()
        if let flowLayout = productRatingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.itemSize = CGSize(width: 13, height: 13)
        }
        
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.minimumInteritemSpacing = 0
//            flowLayout.itemSize = CGSize(width: 100, height: 100)
//        }
//
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
        ratings = productDetailsViewModel.getRatings()
    }
    
    func collectionViewsetUp(){
        self.title = "Products Details"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        productRatingCollectionView.delegate = self
        productRatingCollectionView.dataSource = self
        productRatingCollectionView.register(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImagesDisplayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesDisplayCollectionViewCell")
        
    }
    
    @IBAction func buynowButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProductQuantityViewController") as! ProductQuantityViewController
        vc.productId = productDetailsViewModel.getProductId()
        vc.productName = productDetailsViewModel.getProductName()
        vc.productImage = productDetailsViewModel.getProductImage() ?? ""
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func rateButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProductRatingViewController") as! ProductRatingViewController
        vc.productName = productDetailsViewModel.getProductName()
        vc.productImage = productDetailsViewModel.getProductImage() ?? ""
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }
    
}

extension ProductDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productRatingCollectionView {
            return 5
        } else{
            return productDetailsViewModel.productDetails?.product_images.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == productRatingCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as! RatingCollectionViewCell
            if indexPath.row < ratings {
                cell.ratingImageView.image = UIImage(named: "starfill1")
            } else {
                cell.ratingImageView.image = UIImage(named: "starempty1")
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesDisplayCollectionViewCell", for: indexPath) as! ImagesDisplayCollectionViewCell
            //cell.pageControl.isHidden = true
            let productImage = productDetailsViewModel.productDetails?.product_images[indexPath.row]
            if let imageUrl = productImage?.image {
                cell.imagesDisplay.sd_setImage(with: imageUrl)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesDisplayCollectionViewCell", for: indexPath) as! ImagesDisplayCollectionViewCell
        let productImage = productDetailsViewModel.productDetails?.product_images[indexPath.row]
        if let imageUrl = productImage?.image {
            imageView.sd_setImage(with: imageUrl)
        }
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        if collectionView == collectionView{
    //            let cellWidth = collectionView.frame.width/3 - 10
    //            let cellheight = collectionView.frame.width/3 - 5
    //            return CGSize(width: cellWidth, height: cellheight)
    //        }
    //    }
    
}
