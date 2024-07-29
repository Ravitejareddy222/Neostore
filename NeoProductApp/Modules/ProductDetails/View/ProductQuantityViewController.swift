//
//  ProductQuantityViewController.swift
//  NeoProductApp
//
//  Created by Neo on 16/07/24.
//

import UIKit

class ProductQuantityViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var productQuantityTextField: UITextField!
    @IBOutlet weak var productNamelabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var viewModel = AddToCartViewModel()
    var productId = 0
    var productImage: String = ""
    var productName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productNamelabel.text = productName
        setUpView()
    }
    func setUpView(){
        productQuantityTextField.layer.borderColor = UIColor.green.cgColor
        if let imageUrl = URL(string: productImage){
            productImageView.sd_setImage(with: imageUrl)
        }
        let backgroundView = UIView(frame: view.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopup))
        backgroundView.addGestureRecognizer(tapGesture)
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
    }
    @objc private func dismissPopup() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let productQty = Int(productQuantityTextField.text ?? "") ?? 0
        
        if productQty > 0{
            viewModel.addToCart(product_id: productId, productQuantity: productQty) { [weak self] error in
                
                guard let self = self else { return }
                if let error  = error {
                    print("failed to place order: \(error.localizedDescription)")
                } else{
                    DispatchQueue.main.async {
                        ShowAlert.showAlert(on: self, title: "Congrats", message: "")
                    }
                }
            }
        } else{
            ShowAlert.showAlert(on: self, title: "Error", message: "Please enter the quantity")
        }
        dismiss(animated: true, completion: nil)
    }
}
