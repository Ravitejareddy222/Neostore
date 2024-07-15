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
        
    }
    

}
