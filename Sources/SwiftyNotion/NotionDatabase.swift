//
//  File.swift
//  
//
//  Created by James Saeed on 2021-07-01.
//

import Foundation

public struct NotionDatabase: NotionObject {
    public let id: String
    public let createdTime: String
    public let lastEditedTime: String
    
    public let title: [NotionRichText]
    
    public let properties: [String: NotionDatabaseProperty]
    
    // TODO: parent, properties, object
}

public struct NotionDatabaseProperty: Decodable {
    public let id: String
    public let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, type
        case title, richText, number, select, multiSelect, date, people, file, checkbox, url, email, phoneNumber, formula, relation, rollUp, createdTime, createdBy, lastEditedTime, lastEditedBy
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
    }
}
