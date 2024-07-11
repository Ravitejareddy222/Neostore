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
        let hexColor = UIColor(hex: 0xFFFFFF)
        appNameLabel.textColor = hexColor
        
    }
  
    @IBAction func loginButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

