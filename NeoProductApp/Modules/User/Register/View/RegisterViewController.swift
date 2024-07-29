//
//  RegisterViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    var viewModel = RegisterViewModel()
    var password = ""
    var confirmPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpView()
    }
    
    func setUpView(){

    setTitle("Register")
//        navigationController?.navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.white
//        ]
//        navigationController?.navigationBar.tintColor = UIColor.white
        tableView.register(UINib(nibName: "RegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "RegisterTableViewCell")
        
    }
    
}
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterTableViewCell", for: indexPath) as! RegisterTableViewCell
        cell.delegate = self
        cell.registerViewContoller = self
        
        if let personImage = UIImage(systemName: "person.fill") {
            TextFieldHelper.addleftIconImage(to: cell.firstNameTextField, image: personImage, placeholderText: "First Name")
        }
        
        if let personImage = UIImage(systemName: "person.fill") {
            TextFieldHelper.addleftIconImage(to: cell.lastNameTextField, image: personImage, placeholderText: "Last Name")
        }
        
        if let envelopeImage = UIImage(systemName: "envelope.fill") {
            TextFieldHelper.addleftIconImage(to: cell.emailTextField, image: envelopeImage, placeholderText: "Email")
        }
        
        if let lockImage = UIImage(systemName: "lock.fill") {
            TextFieldHelper.addleftIconImage(to: cell.passowrdTextField, image: lockImage, placeholderText: "Password")
        }
        
        if let lockImage = UIImage(systemName: "lock.fill") {
            TextFieldHelper.addleftIconImage(to: cell.confirmPasswordTextField, image: lockImage, placeholderText: "Confirm Password")
        }
        
        if let phoneImage = UIImage(systemName: "iphone.gen3") {
            TextFieldHelper.addleftIconImage(to: cell.phoneNumberTextField, image: phoneImage, placeholderText: "Phone Number")
        }
       
        return cell
    }
}
extension RegisterViewController: RegisterTableViewCellDelegate{
    func didRegisterButtonTapped() {
        print("yes")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}
