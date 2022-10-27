//
//  Wine.swift
//  SwiftHTTPExample
//
//  Created by Dylan Rafferty on 10/1/22.
//

import Foundation

struct Wine: Hashable, Decodable, Identifiable {
    let winery: String
    let wine: String
    let rating: Rating
    let location: String
    let image: String
    let id: Int
    
    var imageURL: URL? {
        URL(string: image)
    }
    
    struct Rating: Hashable, Decodable {
        let average: String
        let reviews: String
    }
}
