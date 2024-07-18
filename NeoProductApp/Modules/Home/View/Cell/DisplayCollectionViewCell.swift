//
//  DisplayCollectionViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 11/07/24.
//

import UIKit

class DisplayCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var diaplayImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        diaplayImage.contentMode = .scaleToFill
        diaplayImage.clipsToBounds = true
    }

}
