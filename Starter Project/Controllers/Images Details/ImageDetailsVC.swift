//
//  ImageDetailsVC.swift
//  Starter Project
//
//  Created by Newsemicolon on 01/04/2023.
//

import UIKit

class ImageDetailsVC: UIViewController {
    //MARK: - OutLets
    @IBOutlet weak var imageDetailsImageView: UIImageView!
    //MARK: - Variable
    var images: ImagesModel?
    let networkingServices = NetworkingServices()
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
}
//MARK: - Fetch Image
extension ImageDetailsVC {
    func fetchImage(){
        guard let imageUrl = images?.urls?.small else {return}
        DispatchQueue.global(qos: .background).async {
            self.networkingServices.getImagesFromUrl(urlString: imageUrl) { imageData, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    if let imageData = imageData {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.imageDetailsImageView.image = image
                           
                        }
                    }
                }
            }
        }
    }
}
