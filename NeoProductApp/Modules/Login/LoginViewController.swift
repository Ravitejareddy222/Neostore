//
//  ViewController.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        navigationItem.backButtonTitle = " "
    }
  
    @IBAction func loginButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ProductListViewController") as? ProductListViewController
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}

