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
    
    var productImage: String = ""
    var productName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetUp()
        productNamelabel.text = productName
        if let imageUrl = URL(string: productImage){
            productImageView.sd_setImage(with: imageUrl)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        view.addGestureRecognizer(tapGesture)
    }
    
    func collectionViewSetUp(){
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell")
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.itemSize = CGSize(width: 40, height: 40)
        }
    }
    
    @objc private func dismissPopup() {
        dismiss(animated: true, completion: nil)
    }
}

extension ProductRatingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as? RatingCollectionViewCell
        
        return cell ?? UICollectionViewCell()
    }
    
    
    
    
}
