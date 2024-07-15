//
//  ViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        navigationItem.backButtonTitle = " "
        if let personImage = UIImage(systemName: "person.fill"){
            TextFieldHelper.addleftIconImage(to: usernameTextField, image: personImage, placeholderText: "Username")
        }
        if let passwordImage = UIImage(systemName: "lock.fill"){
            TextFieldHelper.addleftIconImage(to: passwordTextField, image: passwordImage, placeholderText: "Password")
        }
        loginButton.layer.cornerRadius = 10
    }
  
    @IBAction func loginButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "HomeScreenStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "HomeScreenViewController") as? HomeScreenViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ForgotPasswordStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegisterViewStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}



