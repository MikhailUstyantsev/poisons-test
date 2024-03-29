//
//  Poison.swift
//  PoisonsAppTest
//
//  Created by Mikhail Ustyantsev on 13.01.2024.
//

import Foundation

typealias Poisons = [Poison]

// MARK: - Poison
struct Poison: Codable {
    let id: Int
    let image: String
    let categories: Categories
    let name, description: String
    let documentation: String?
    let fields: [Field]
}

// MARK: - Categories
struct Categories: Codable {
    let id: Int
    let icon, image, name: String
}

// MARK: - Field
struct Field: Codable {
    let typesID: Int
    let type: TypeEnum
    let name, value: String
    let image: String?
    let flags: Flags
    let show, group: Int
    
    enum CodingKeys: String, CodingKey {
        case typesID = "types_id"
        case type, name, value, image, flags, show, group
    }
}

// MARK: - Flags
struct Flags: Codable {
    let html, noValue, noName, noImage: Int
    let noWrap, noWrapName, system: Int
    
    enum CodingKeys: String, CodingKey {
        case html
        case noValue = "no_value"
        case noName = "no_name"
        case noImage = "no_image"
        case noWrap = "no_wrap"
        case noWrapName = "no_wrap_name"
        case system
    }
}

enum TypeEnum: String, Codable {
    case image = "image"
    case list = "list"
    case text = "text"
}



extension Poison: Hashable {
    public static func == (lhs: Poison, rhs: Poison) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func contains(_ filter: String?) -> Bool {
        guard let filterText = filter else { return true }
        if filterText.isEmpty { return true }
        let lowercasedFilter = filterText.lowercased()
        return name.lowercased().contains(lowercasedFilter)
    }
}

