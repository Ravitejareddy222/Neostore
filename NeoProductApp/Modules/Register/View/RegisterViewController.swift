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
    
    var array: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpView()
    }
    
    func setUpView(){
        setTitle("Register")
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
        tableView.register(UINib(nibName: "RegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "RegisterTableViewCell")
        tableView.register(UINib(nibName: "GenderTableViewCell", bundle: nil), forCellReuseIdentifier: "GenderTableViewCell")
        tableView.register(UINib(nibName: "RegisterButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "RegisterButtonTableViewCell")
    }
    
}
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenderTableViewCell", for: indexPath) as! GenderTableViewCell
            
            return cell
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterButtonTableViewCell", for: indexPath) as! RegisterButtonTableViewCell
            return cell
        }else if (0...4).contains(indexPath.row) || indexPath.row == 6 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterTableViewCell", for: indexPath) as! RegisterTableViewCell
                var placeholderTxt = ""
                var textFieldImage = ""
                
                switch indexPath.row {
                case 0 :
                    placeholderTxt = "First Name"
                    textFieldImage = "person.fill"
                case 1 :
                    placeholderTxt = "Last Name"
                    textFieldImage = "person.fill"
                case 2 :
                    placeholderTxt = "Email"
                    textFieldImage = "envelope.fill"
                case 3 :
                    placeholderTxt = "Password"
                    textFieldImage = "lock.fill"
                case 4 :
                    placeholderTxt = "Confirm Password"
                    textFieldImage = "lock.fill"
                case 6 :
                    placeholderTxt = "Phone Number"
                    textFieldImage = "iphone.gen3"
                default:
                    break
                }
                let personImage = UIImage(systemName: textFieldImage)!
                TextFieldHelper.addleftIconImage(to: cell.userTextField, image: personImage, placeholderText: placeholderTxt)
                return cell
            }
            return UITableViewCell()
        }
   
}
