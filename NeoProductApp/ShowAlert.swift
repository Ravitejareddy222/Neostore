//
//  CustomButton.swift
//  NeoProductApp
//
//  Created by Neo on 18/07/24.
//

import Foundation
import UIKit

class ShowAlert{
    static func showAlert(on ViewController: UIViewController , title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion: nil)
    }
}
