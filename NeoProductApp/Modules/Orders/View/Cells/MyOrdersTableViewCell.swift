//
//  MyOrdersTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit

class MyOrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderIDLabel: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
