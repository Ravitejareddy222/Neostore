//
//  ProductListTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productname: UILabel!
    @IBOutlet weak var productManufacturer: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ratings: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "RatingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RatingCollectionViewCell")
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.itemSize = CGSize(width: 13, height: 13)
            flowLayout.invalidateLayout()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension ProductListTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingCollectionViewCell", for: indexPath) as! RatingCollectionViewCell
        
        if indexPath.row < ratings{
            cell.ratingImageView.image = UIImage(named: "starfill1")
        } else{
            cell.ratingImageView.image = UIImage(named: "starempty1")
        }
        
          return cell
    }
    
    func configure(rating: Int){
        self.ratings = rating
        self.collectionView.reloadData()
    }
}
