//
//  EditProfileViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "MyAccountTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCell")
//        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfilePictureTableViewCell")
//        tableView.register(UINib(nibName: "EditButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "EditButtonTableViewCell")
        
    
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
