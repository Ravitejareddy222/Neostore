//
//  ProductRatingViewController.swift
//  NeoProductApp
//
//  Created by Neo on 17/07/24.
//

import UIKit

class ProductRatingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var productNamelabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var starOne: UIButton!
    @IBOutlet weak var starTwo: UIButton!
    @IBOutlet weak var starThree: UIButton!
    @IBOutlet weak var starFour: UIButton!
    @IBOutlet weak var starFive: UIButton!
    @IBOutlet weak var rateNowButton: UIButton!

    
    
    var productImage: String = ""
    var productName: String = ""
    var productId: Int = 0
    var rating: Int = 0
    
    var productRatingViewModel = ProductRatingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tag()
        // collectionViewSetUp()
        setupBackgroundView()
        productNamelabel.text = productName
        if let imageUrl = URL(string: productImage){
            productImageView.sd_setImage(with: imageUrl)
        }
    }
    func tag(){
        starOne.tag = 1
        starTwo.tag = 2
        starThree.tag = 3
        starFour.tag = 4
        starFive.tag = 5
        starOne.contentMode = .scaleAspectFit
            starTwo.contentMode = .scaleAspectFit
            starThree.contentMode = .scaleAspectFit
            starFour.contentMode = .scaleAspectFit
            starFive.contentMode = .scaleAspectFit
    }
    
    func setupBackgroundView(){
        let backgroundView = UIView(frame: view.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        backgroundView.addGestureRecognizer(tapGesture)
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
    }
    
    func collectionViewSetUp(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell")
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.itemSize = CGSize(width: 40, height: 40)
            flowLayout.invalidateLayout()
        }
    }
    
    @IBAction func starButtonTapped(_ sender: UIButton){
        rating = sender.tag
        updateStars(rating: rating ?? 0)
        
    }
    @objc private func dismissPopup() {
        dismiss(animated: true, completion: nil)
    }
    func updateStars(rating: Int) {
        let allStars = [starOne, starTwo, starThree, starFour, starFive]
        
        for (index, starButton) in allStars.enumerated() {
            if index < rating {
                let starfill = UIImage(systemName: "star.fill")?.withTintColor(UIColor(named: "yellow#ffba00") ?? .yellow, renderingMode: .alwaysOriginal)
                let imageSize = CGSize(width: 45, height: 45)
                let renderer = UIGraphicsImageRenderer(size: imageSize)
                let resizedImage = renderer.image { _ in
                    starfill?.draw(in: CGRect(origin: .zero, size: imageSize))
                }
                starButton?.setImage(starfill, for: .normal)
            } else {
                let starfill = UIImage(systemName: "star")
                starButton?.setImage(starfill, for: .normal)
            }
        }
    }
    
    @IBAction func rateNowButtonTapped(_ sender: UIButton){
        let parameters = ProductRatingParameters(product_id: productId, rating: rating ?? 0)
        productRatingViewModel.setProductRatings(with: parameters) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                print("Failed :\(error.localizedDescription)")
              }
            DispatchQueue.main.async {
                ShowAlert.showAlert(on: self, title: "Message", message: "Thanks for Product Rating")
            }
        }
    }
    
    
    
}

extension ProductRatingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as? RatingCollectionViewCell
        
        if indexPath.row < rating {
            cell?.ratingImageView.image = UIImage(named: "starfill1")
        } else {
            cell?.ratingImageView.image = UIImage(named: "starempty1")
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    
    
    
}
