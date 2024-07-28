//
//  ImageStore.swift
//  NeoProductApp
//
//  Created by Neo on 27/07/24.
//

import Foundation
import UIKit

class ImageStore {
    
    static let shared = ImageStore()
    
    func saveImage(image: UIImage, personName: String) -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Error finding documents directory")
            return nil
        }
        
        let fileURL = documentsDirectory.appendingPathComponent("\(personName).jpg")
        
        do {
            if let imageData = image.jpegData(compressionQuality: 1.0) {
                try imageData.write(to: fileURL)
                print("Image saved successfully at path: \(fileURL.path)")
                return fileURL
            } else {
                print("Error converting image to JPEG format")
                return nil
            }
        } catch {
            print("Error saving image:", error)
            return nil
        }
    }
    
    func loadImage(personName: String) -> UIImage? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Error finding documents directory")
            return nil
        }
        
        let fileURL = documentsDirectory.appendingPathComponent("\(personName).jpg")
        
        do {
            let imageData = try Data(contentsOf: fileURL)
            let image = UIImage(data: imageData)
            return image
        } catch {
            print("Error loading image:", error)
            return nil
        }
    }
}
