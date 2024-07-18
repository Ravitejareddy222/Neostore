//
//  ProductQuantityViewController.swift
//  NeoProductApp
//
//  Created by Neo on 16/07/24.
//

import UIKit

class ProductQuantityViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
