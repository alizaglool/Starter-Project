//
//  File.swift
//  Starter Project
//
//  Created by Newsemicolon on 30/03/2023.
//

import Foundation
import UIKit

class NetworkingServices {
    //MARK: - Access Key
    private let accessKey = "Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
    //MARK: - Fetch All Images
    func fetchAllImageData(completion:@escaping ([ImagesModel]?, Error?)->() ) {
        guard let url = URL(string: "https://api.unsplash.com/photos?client_id=\(accessKey)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let images = try decoder.decode([ImagesModel].self, from: data)
                completion(images, nil)
            } catch {
                print(error.localizedDescription)
                completion(nil, error.localizedDescription as? Error)
            }
        }.resume()
    }
    //MARK: - get Image From Url
    func getImagesFromUrl(urlString: String, completion: @escaping (Data?, Error?)->()){
        guard let url = URL(string: urlString) else { return  }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            completion(data, nil)
        }
        task.resume()
    }
}
