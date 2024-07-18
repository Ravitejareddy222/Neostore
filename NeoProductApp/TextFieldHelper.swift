//
//  TextFieldHelper.swift
//  NeoProductApp
//
//  Created by Neo on 12/07/24.
//

import Foundation
import UIKit

class TextFieldHelper {
    
    static func addleftIconImage(to textField: UITextField, image: UIImage, placeholderText: String) {
       let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
       let leftImageView = UIImageView(frame: CGRect(x: 8, y: 8, width: 24, height: 24))
        leftImageView.image = image
        leftImageView.tintColor = .white
        leftView.addSubview(leftImageView)
        textField.leftViewMode = .always
        textField.leftView = leftView
       
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
       
       let hexColor = UIColor(hex: 0xFFFFFF)
       textField.textColor = hexColor
       let attributes = [
           NSAttributedString.Key.foregroundColor: UIColor.white,
           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
       ]
       textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
    }
    
   
}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
