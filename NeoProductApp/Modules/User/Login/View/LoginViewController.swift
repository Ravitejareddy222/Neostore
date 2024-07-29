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
    @IBOutlet weak var accountLabel: UILabel!
    
    var viewModel = LoginViewModel()
    var forgotPasswordViewModel = ForgotPasswordViewModel()
    var isForgotPasswordMode = false
    
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
        if isForgotPasswordMode {
            submitButtonTapped()
        } else {
            let email = usernameTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            let params = LoginParams(email: email, password: password)
            print(params)
            
            viewModel.loginUser(with: params){ [weak self] error in
                guard let self = self else{return}
                let statusCode = self.viewModel.getStatusCode()
                
                DispatchQueue.main.async {
                    if statusCode == 200 {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(identifier: "HomeScreenViewController") as? HomeScreenViewController
                        vc?.name = self.viewModel.getName()
                        vc?.email = self.viewModel.getEmail()
                        self.navigationController?.pushViewController(vc!, animated: true)
                    } else if statusCode == 401{
                        ShowAlert.showAlert(on: self, title: "Error", message: "Please enter the Valid Email and Password")
                    }
                    
                    if let error = error {
                        ShowAlert.showAlert(on: self, title: "Error", message: "Please enter the Valid Email and Password")
                        print("Login failed: \(error.localizedDescription)")
                    }
                    
                }
            }
        }
    }
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        passwordTextField.isHidden = true
        forgotPasswordButton.isHidden = true
        loginButton.setTitle("SUBMIT", for: .normal)
        accountLabel.isHidden = true
        registerButton.isHidden = true
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = UIColor(named: "customWhite")
        navigationItem.leftBarButtonItem = backButton
        isForgotPasswordMode = true
        
    }
    
    
    func submitButtonTapped(){
        isForgotPasswordMode = false
        let email = usernameTextField.text ?? ""
        
        forgotPasswordViewModel.sendRequest(email: email){ [weak self] error in
            guard let self = self else { return }
            
            if let error = error{
                ShowAlert.showAlert(on: self, title: "error", message: "Please enter the Valid Email and password")
                print("failed: \(error)")
                
            }
            DispatchQueue.main.async {
                let statusCode = self.forgotPasswordViewModel.getStatusCode()
                    if statusCode == 200{
                    ShowAlert.showAlert(on: self, title: "Congratulations", message: "Password sent to your email Successfully")
                    } else if statusCode == 400 {
                        ShowAlert.showAlert(on: self, title: "Error", message: "Please enter the Email")
                    } else if statusCode == 401 {
                        ShowAlert.showAlert(on: self, title: "Error", message: "Please enter the Valid Email")
                    }
            }
        }
    }
    
    @objc func backButtonTapped(){
        passwordTextField.isHidden = false
        forgotPasswordButton.isHidden = false
        loginButton.setTitle("LOGIN", for: .normal)
        accountLabel.isHidden = false
        registerButton.isHidden = false
        navigationItem.leftBarButtonItem = nil
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegisterViewStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}



