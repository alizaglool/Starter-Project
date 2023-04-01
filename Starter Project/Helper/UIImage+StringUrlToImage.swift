//
//  UIImage+StringUrlToImage.swift
//  Starter Project
//
//  Created by Newsemicolon on 30/03/2023.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromStringUrl(stringUrl: String){
        
        DispatchQueue.global().async {
            if let url = URL(string: stringUrl) {
                if let imageData = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
    }

}
