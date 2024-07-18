//
//  MyAccountTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit

class MyAccountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        userTextField.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func enableTextField(){
//        userTextField.isUserInteractionEnabled = true
//    }
    
}
