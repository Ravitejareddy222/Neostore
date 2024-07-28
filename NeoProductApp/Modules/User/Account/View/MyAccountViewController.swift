//
//  MyAccountViewController.swift
//  NeoProductApp
//
//  Created by Neo on 12/07/24.
//

import UIKit

class MyAccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var ContentView: UIView!
    
    var viewModel = MyAccountViewModel()
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetUp()
        fetchUser()
    }
    
    func fetchUser(){
        viewModel.fetchUserDetails(){ [weak self ] error in
            guard let self = self else { return }
            
            if let error = error{
                print("failed to fetch details:\(error)")
            } else{
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    func tableViewSetUp(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfilePictureTableViewCell")
        tableView.register(UINib(nibName: "MyAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCell")
    }
    
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ResetPasswordViewController") as? ResetPasswordViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension MyAccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountTableViewCell") as! MyAccountTableViewCell
        cell.delegate = self
        cell.setImage(selectedImage)
        
        if let personImage = UIImage(systemName: "person.fill") {
            TextFieldHelper.addleftIconImage(to: cell.firstNameTextField, image: personImage, placeholderText: "First Name")
        }
        
        if let personImage = UIImage(systemName: "person.fill") {
            TextFieldHelper.addleftIconImage(to: cell.lastNameTextField, image: personImage, placeholderText: "Last Name")
        }
        
        if let envelopeImage = UIImage(systemName: "envelope.fill") {
            TextFieldHelper.addleftIconImage(to: cell.emailTextField, image: envelopeImage, placeholderText: "Email")
        }
        
        if let lockImage = UIImage(systemName: "birthday.cake") {
            TextFieldHelper.addleftIconImage(to: cell.dateofbirthTextField, image: lockImage, placeholderText: "DOB")
        }
        
        if let phoneImage = UIImage(systemName: "iphone.gen3") {
            TextFieldHelper.addleftIconImage(to: cell.phoneNumberTextField, image: phoneImage, placeholderText: "Phone Number")
        }
        
        cell.firstNameTextField.text = viewModel.getFirstName()
        cell.lastNameTextField.text = viewModel.getLastName()
        cell.emailTextField.text = viewModel.getEmail()
        cell.phoneNumberTextField.text = viewModel.getPhoneNumber()
        cell.dateofbirthTextField.text = viewModel.getDOB()
        return cell
    }

}

extension MyAccountViewController: MyAccountTableViewCellDelegate {
    
    func didEditProfileButtonTapped() {
        resetPasswordButton.isHidden = true
        ContentView.backgroundColor = UIColor(named: "customred")
    }
    
    func didSelectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func setImage(_ image: UIImage?) {
        selectedImage = image
        tableView.reloadData()
    }
}

extension MyAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            self.selectedImage = selectedImage
            print(selectedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

