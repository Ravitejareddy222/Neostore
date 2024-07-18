//
//  AddAddressViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class AddAddressViewController: UIViewController {
    
    @IBOutlet weak var saveAddress: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        self.title = "Add Address"

    }
    
    @IBAction func saveAddressButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddressListViewController") as? AddressListViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}
