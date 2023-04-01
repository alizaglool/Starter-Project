//
//  Model.swift
//  Starter Project
//
//  Created by Newsemicolon on 30/03/2023.
//

import Foundation

// MARK: - ImagesModelElement
struct ImagesModel: Codable {
    let id: String?
    let width, height: Int?
    let urls: Urls?

    enum CodingKeys: String, CodingKey {
        case id
        case width, height
        case urls
    }
}
// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
