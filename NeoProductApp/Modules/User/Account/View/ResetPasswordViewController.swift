//
//  ResetPasswordViewController.swift
//  NeoProductApp
//
//  Created by Neo on 12/07/24.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    var viewModel = ResetPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    func setUpView(){
        if let lockImage = UIImage(systemName: "lock.fill"){
            TextFieldHelper.addleftIconImage(to: currentPasswordTextField, image: lockImage , placeholderText: "Current Password")
            TextFieldHelper.addleftIconImage(to: newPasswordTextField, image: lockImage , placeholderText: "New Password")
            TextFieldHelper.addleftIconImage(to: confirmPasswordTextField, image: lockImage , placeholderText: "Confirm Password")
            resetPasswordButton.layer.cornerRadius = 10
            self.title = "Reset Password"
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        }
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        let oldPassword = currentPasswordTextField.text ?? ""
        let newPassword = newPasswordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        if newPassword == confirmPassword {
            let parameters = ResetPasswordParameters(old_password: oldPassword, password: newPassword ,confirm_password: confirmPassword)
            
            viewModel.resetUserPassword(with: parameters) { [weak self] error in
                guard let self = self else { return }
                
                if let error = error {
                    print("Failed :\(error.localizedDescription)")
                  }
                DispatchQueue.main.async {
                    if self.viewModel.getStatusCode() == 200{
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        } else{
            DispatchQueue.main.async {
                ShowAlert.showAlert(on: self, title: "Error", message: "Passwords do not match")
            }
        }
        
    }
}
