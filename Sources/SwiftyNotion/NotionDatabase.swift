//
//  File.swift
//  
//
//  Created by James Saeed on 2021-07-01.
//

import Foundation

struct NotionDatabase: NotionObject {
    let id: String
    let createdTime: String
    let lastEditedTime: String
    
    let title: [NotionRichText]
    
    let properties: [String: NotionDatabaseProperty]
    
    // TODO: parent, properties, object
}

struct NotionDatabaseProperty: Decodable {
    let id: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, type
        case title, richText, number, select, multiSelect, date, people, file, checkbox, url, email, phoneNumber, formula, relation, rollUp, createdTime, createdBy, lastEditedTime, lastEditedBy
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
    }
}
