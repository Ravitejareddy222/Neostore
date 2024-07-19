//
//  EditButtonTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class EditButtonTableViewCell: UITableViewCell {
     
    @IBOutlet weak var editButton: UIButton!
    var hideResetPasswordClosure: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    @IBAction func editProfileButtonTapped(_ sender: Any) {
        editButton.setTitle("Submit", for: .normal)
        hideResetPasswordClosure?()
    }
     
    
    
    
}
