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
    @IBOutlet weak var productSave: UIButton!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
