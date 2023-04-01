//
//  ViewController.swift
//  Starter Project
//
//  Created by Ahmed M. Hassan on 26/03/2023.
//

import UIKit

class ImagesViewController: UIViewController {
    //MARK: - OutLets
    @IBOutlet weak var imageTableView: UITableView!
    //MARK: - Variable
    var images: [ImagesModel] = []
    private let networkingServices = NetworkingServices()
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        fetchImagesView()
    }
}
//MARK: - Fetch Images
extension ImagesViewController {
    func fetchImagesView(){
        DispatchQueue.global(qos: .background).async {
            self.networkingServices.fetchAllImageData { [weak self] images, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                }else {
                    DispatchQueue.main.async {
                        self?.images = images ?? []
                        self?.imageTableView.reloadData()
                    }
                }
            }
        }
    }
}


