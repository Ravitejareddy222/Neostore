//
//  AddedAddressTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class AddedAddressTableViewCell: UITableViewCell {
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        toggleButton.layer.cornerRadius = toggleButton.frame.width/2
        toggleButton.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        //toggleButton.backgroundColor = UIColor.lightGray

    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
        

    }
    
}
