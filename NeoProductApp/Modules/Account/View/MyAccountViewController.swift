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
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCell")
        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfilePictureTableViewCell")
        tableView.register(UINib(nibName: "EditButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "EditButtonTableViewCell")
        
    }
    

    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ResetPasswordViewController") as? ResetPasswordViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func editProfileButtonTapped(_ sender: Any) {
        
    }
    
}

extension MyAccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if (indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePictureTableViewCell") as! ProfilePictureTableViewCell
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditButtonTableViewCell") as? EditButtonTableViewCell
            cell?.backgroundColor = UIColor(named: "customred")
            return cell ??  UITableViewCell()
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyAccountTableViewCell") as!  MyAccountTableViewCell
            var textFieldtxt = ""
            var textFieldImage = ""
            switch indexPath.row {
            case 1:
                textFieldtxt = "Sagar"
                textFieldImage = "person.fill"
            case 2:
                textFieldtxt = "Shinde"
                textFieldImage = "person.fill"
            case 3:
                textFieldtxt = "Sagarshinde@www.india.com"
                textFieldImage = "envelope.fill"
            case 4:
                textFieldtxt = "9875636790"
                textFieldImage = "iphone.gen3"
            case 5:
                textFieldtxt = "08-11-1857"
                textFieldImage = "birthday.cake"
            default:
                break
            }
            if let leftImage = UIImage(systemName: textFieldImage) {
                TextFieldHelper.addleftIconImage(to: cell.userTextField, image: leftImage, placeholderText: textFieldtxt)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            resetPasswordButton.isHidden = true
        
        }
    }
}
