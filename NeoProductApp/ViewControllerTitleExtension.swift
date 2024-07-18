//
//  ViewControllerTitleExtension.swift
//  NeoProductApp
//
//  Created by Neo on 18/07/24.
//

import Foundation
import UIKit

extension UIViewController{
    func setTitle(_ title: String) {
            let fontSize: CGFloat = 24.0
            let font = UIFont.boldSystemFont(ofSize: fontSize)
            let textAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black,
                .font: font
            ]
            
            if let navigationController = self.navigationController {
                navigationController.navigationBar.titleTextAttributes = textAttributes
                self.title = title  // Set the title of the view controller
            } else {
                print("Warning: This view controller is not embedded in a navigation controller.")
            }
        }
}
