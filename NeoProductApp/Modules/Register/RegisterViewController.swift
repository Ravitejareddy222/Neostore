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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpView()
    }
    
    func setUpView(){
        self.title = "Register"
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
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenderTableViewCell", for: indexPath) as! GenderTableViewCell
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterButtonTableViewCell", for: indexPath) as! RegisterButtonTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterTableViewCell", for: indexPath) as! RegisterTableViewCell
            return cell
        }
    }

}
