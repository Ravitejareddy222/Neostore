//
//  RegisterTableViewCell.swift
//  NeoProductApp
//
//  Created by Neo on 19/07/24.
//

import UIKit

protocol RegisterTableViewCellDelegate: AnyObject{
    func didRegisterButtonTapped()
}

class RegisterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passowrdTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var viewModel = RegisterViewModel()
    weak var delegate: RegisterTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerButton.layer.cornerRadius = 10
        maleButton.layer.cornerRadius = maleButton.frame.width / 2
        maleButton.layer.masksToBounds = true
        femaleButton.layer.cornerRadius = maleButton.frame.width / 2
        femaleButton.layer.masksToBounds = true
        toggleButton.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        guard let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let email = emailTextField.text,
              let password = passowrdTextField.text,
              let confirmPassword = confirmPasswordTextField.text,
              let phoneNumber = Int(phoneNumberTextField.text ?? "")
        else {
            return
        }
        var gender = ""
        if maleButton.backgroundColor == UIColor(named: "customWhite"){
            gender = "M"
        } else{
            gender = "F"
        }
        
        if password == confirmPassword {
            let parameters = RegistrationParameters(first_name: firstName,
                                                    last_name: lastName,
                                                    email: email,
                                                    password: password,
                                                    confirm_password: confirmPassword,
                                                    gender: gender,
                                                    phone_no: phoneNumber)
            
            viewModel.registerUser(with: parameters) { [weak self] error in
                guard let self = self else { return }
                
                if let error = error {
                    print("Registration failed: \(error.localizedDescription)")
                } else {
                    DispatchQueue.main.async {
                        self.delegate?.didRegisterButtonTapped()
                    }
                }
            }
        } else{
//            DispatchQueue.main.async{
//                ShowAlert.showAlert(on: self, title: "Error", message: "Passwords do not match")
//            }
        }
    }
    
    @IBAction func maleButtonTapped(_ sender: Any) {
        maleButton.backgroundColor = UIColor(named: "customWhite")
        femaleButton.backgroundColor = UIColor(named: "customred")
    }
    
    @IBAction func femaleButtonTapped(_ sender: Any) {
        maleButton.backgroundColor = UIColor(named: "customred")
        femaleButton.backgroundColor = UIColor(named: "customWhite")
        
    }
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        if toggleButton.backgroundColor == UIColor(named: "customWhite"){
            toggleButton.backgroundColor = UIColor(named: "customred")
        } else{
            toggleButton.backgroundColor = UIColor(named: "customWhite")
        }
    }
    
}
