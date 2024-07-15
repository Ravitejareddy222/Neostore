//
//  ProfilePictureTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit

class ProfilePictureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.width/2
        profileImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
