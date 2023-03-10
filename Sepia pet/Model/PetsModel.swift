//
//  PetsModel.swift
//  Sepia pet
//
//  Created by Krunal Maisuriya on 10/03/23.
//

import Foundation

// MARK: - PetsModel
struct PetsModel: Codable {
    var pets: [Pet]?
    
    enum CodingKeys: String, CodingKey {
        case pets = "pets"
    }
}


// MARK: - Pet
struct Pet: Codable, Hashable {
    var imageURL: String?
    var title: String?
    var contentURL: String?
    var dateAdded: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title
        case contentURL = "content_url"
        case dateAdded = "date_added"
    }
}
