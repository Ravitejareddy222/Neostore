


import Foundation

struct ProductDetails: Codable {
    let id: Int
    let product_category_id: Int
    let name: String
    let producer: String
    let description: String
    let cost: Int
    let rating: Int
    let view_count: Int
    let created: String
    let modified: String
    let product_images: [ProductImage]
    
    enum CodingKeys: String, CodingKey {
        case id, product_category_id, name, producer, description, cost, rating, view_count, created, modified, product_images
    }
}

struct ProductImage: Codable {
    let id: Int
    let product_id: Int
    let image: URL
    let created: String
    let modified: String
    
    enum CodingKeys: String, CodingKey {
        case id, product_id, image, created, modified
    }
}

struct ProductDetailsResponse: Codable {
    let status: Int
    let data: ProductDetails
    
    enum CodingKeys: String, CodingKey {
        case status, data
    }
}
