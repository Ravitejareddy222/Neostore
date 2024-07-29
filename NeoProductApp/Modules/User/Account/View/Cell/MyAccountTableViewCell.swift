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
    var editProfileViewModel = EditProfileViewModel()
    
    
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
        
        if editButton.title(for: .normal) != "SUBMIT" {
            editButton.setTitle("SUBMIT", for: .normal)
            emailTextField.isUserInteractionEnabled = true
            dateofbirthTextField.isUserInteractionEnabled = true
            phoneNumberTextField.isUserInteractionEnabled = true
        } else{
            editButton.setTitle("EDIT PROFILE", for: .normal)
            emailTextField.isUserInteractionEnabled = false
                    dateofbirthTextField.isUserInteractionEnabled = false
                    phoneNumberTextField.isUserInteractionEnabled = false
                    firstNameTextField.isUserInteractionEnabled = false
                    lastNameTextField.isUserInteractionEnabled = false
            let firstName = firstNameTextField.text ?? ""
            let lastname = lastNameTextField.text  ?? ""
            let email =  firstNameTextField.text  ?? ""
            let phoneNumber = phoneNumberTextField.text  ?? ""
            let dob = dateofbirthTextField.text  ?? ""
            if let image = profileImageButton.image(for: .normal) {
                ImageStore.shared.saveImage(image: image, personName: "\(firstName) \(lastname)")
            } else {
                print("Error: Profile image is missing")
            }
            var base64String = ""
            if let buttonImage = profileImageButton.image(for: .normal) {
                if let base64String = buttonImage.toBase64String() {
                    print("Base64 String: \(base64String)")
                } else {
                    print("Failed to convert image to Base64 string")
                }
            }
            
            let parameters = EditProfileParameters(email: email, dob: dob, profile_pic: base64String, phone_no: phoneNumber)
            
            editProfileViewModel.editProfile(with: parameters){[weak self ] error in
                guard let self = self else { return }
                
                if let error = error{
                    print("failed to update:\(error)")
                } else{
                    DispatchQueue.main.async{
                        //self.tableView.reloadData()
                    }
                }
                
            }
        }
        
    }
    
    
    @IBAction func profileImageButtonTapped(_ sender: Any) {
        delegate?.didSelectProfileImage()
    }
    
    func setImage(_ image: UIImage?) {
        print("2: setImage called in MyAccountTableViewCell")
        profileImageButton.setImage(image, for: .normal)
    }
}

extension UIImage {
    func toBase64String() -> String? {
        // Convert UIImage to JPEG data
        guard let imageData = self.jpegData(compressionQuality: 1.0) else {
            print("Error: Unable to convert image to JPEG data")
            return nil
        }
        // Convert JPEG data to Base64 string
        return imageData.base64EncodedString()
    }
}
