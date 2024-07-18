//
//  EditButtonTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class EditButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var editButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func editProfileButtonTapped(_ sender: Any) {
        editButton.setTitle("Submit", for: .normal)
        
    }
    
}
