//
//  ImageTableViewCell.swift
//  Starter Project
//
//  Created by Newsemicolon on 30/03/2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imageViewCell: UIImageView!
    
    let networkServies = NetworkingServices()
    static let identifier = "ImageTableViewCell"
    static func Nib()-> UINib{
        return UINib(nibName: "ImageTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageViewCell.layer.cornerRadius = 8
    }
    
    func configure(with image: ImagesModel) {
        DispatchQueue.global(qos: .background).async {
            guard let urlString = image.urls?.small else { return }
            self.networkServies.getImagesFromUrl(urlString: urlString) { imageData, error in
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.imageViewCell.image = image
                    }
                }
            }
        }
    }
}
