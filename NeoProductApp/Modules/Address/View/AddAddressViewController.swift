//
//  AddAddressViewController.swift
//  NeoProductApp
//
//  Created by Neo on 15/07/24.
//

import UIKit

class AddAddressViewController: UIViewController {
    
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var landmarkTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var saveAddress: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        setTitle("Add Address")
    }
    
    @IBAction func saveAddressButtonTapped(_ sender: Any) {
        let addressText = addressTextView.text ?? ""
        let landmark = landmarkTextField.text ?? ""
        let city = cityTextField.text ?? ""
        let state = stateTextField.text ?? ""
        let pincode = pincodeTextField.text ?? ""
        let country = countryTextField.text ?? ""
        
        guard !addressText.isEmpty, !landmark.isEmpty, !city.isEmpty, !state.isEmpty, !pincode.isEmpty, !country.isEmpty else{
            ShowAlert.showAlert(on: self, title: "error", message: "Please fill in all the details")
            return
        }
        let address = "\(addressText), \(landmark), \(city), \(state), \(pincode), \(country)"
        var addressArray = UserDefaults.standard.array(forKey: "MyAddressList") as? [String] ?? []
        addressArray.append(address)
        print(addressArray)
        UserDefaults.standard.set(addressArray, forKey: "MyAddressList")
        
        let storyboard = UIStoryboard(name: "AddressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddressListViewController") as? AddressListViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}
