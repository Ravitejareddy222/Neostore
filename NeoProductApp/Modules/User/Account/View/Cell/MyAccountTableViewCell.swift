//
//  MyAccountTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 13/07/24.
//

import UIKit

protocol MyAccountTableViewCellDelegate{
    func didEditProfileButtonTapped()
    func didSelectProfileImage()
    func setImage(_ image: UIImage?)
    
}

class MyAccountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateofbirthTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    var delegate: MyAccountTableViewCellDelegate?
    var imagePicker = UIImagePickerController()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        profileImageButton.layer.cornerRadius = profileImageButton.frame.width/2
        profileImageButton.layer.masksToBounds = true
        editButton.layer.cornerRadius = 10
        firstNameTextField.isUserInteractionEnabled = false
        lastNameTextField.isUserInteractionEnabled = false
        emailTextField.isUserInteractionEnabled = false
        dateofbirthTextField.isUserInteractionEnabled = false
        phoneNumberTextField.isUserInteractionEnabled = false
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func editProfileButtonTapped(_ sender: Any) {
        editButton.setTitle("SUBMIT", for: .normal)
        emailTextField.isUserInteractionEnabled = true
        dateofbirthTextField.isUserInteractionEnabled = true
        phoneNumberTextField.isUserInteractionEnabled = true
        delegate?.didEditProfileButtonTapped()
        setNewValues()
    }
    
    func setNewValues(){
        let firstName = firstNameTextField.text
        let lastname = lastNameTextField.text
        let email =  firstNameTextField.text
        let phoneNumber = phoneNumberTextField.text
        let dob = dateofbirthTextField.text
        
//                if let image = profileImage.image {
//                    ImageStore.shared.saveImage(image: image, personName: "\(firstName) \(lastname)")
//                } else {
//                    print("Error: Profile image is missing")
//                }
    }
    
    @IBAction func profileImageButtonTapped(_ sender: Any) {
        delegate?.didSelectProfileImage()
    }
    
    func setImage(_ image: UIImage?) {
        print("finalq")
        profileImageButton.setImage(image, for: .normal)
    }
}

