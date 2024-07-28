//
//  ForgotPasswordViewController.swift
//  NeoProductApp
//
//  Created by Neo on 11/07/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        if let personImage = UIImage(systemName: "person.fill"){
            TextFieldHelper.addleftIconImage(to: usernameTextField, image: personImage, placeholderText: "Username")
        }
        if let lockImage = UIImage(systemName: "lock.fill"){
            TextFieldHelper.addleftIconImage(to: newPasswordTextField, image: lockImage, placeholderText: "New Password")
        }
        
        if let lockImage = UIImage(systemName: "lock.fill"){
            TextFieldHelper.addleftIconImage(to: confirmNewPasswordTextField, image: lockImage, placeholderText: "Confirm New Password")
        }
        submitButton.layer.cornerRadius = 10
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
