//
//  NotionPage.swift
//  
//
//  Created by James Saeed on 2021-07-01.
//

import Foundation

public struct NotionPage: NotionObject {
    public let id: String
    public let createdTime: String
    public let lastEditedTime: String

    public let archived: Bool
    
    public let properties: [String: NotionPageProperty]
    
    // TODO: parent, object
}

public struct NotionPageProperty: Decodable {
    public let id: String
    public let type: NotionPagePropertyType
    
    public let title: [NotionRichText]?
    public let richText: [NotionRichText]?
    public let number: Double?
    public let select: NotionSelect?
    public let multiSelect: [NotionSelect]?
    public let date: NotionDateRange?
    public let relation: NotionRelation?
    public let people: [NotionPerson]?
    public let checkbox: Bool?
    public let url: String?
    public let email: String?
    public let phoneNumber: String?
    
    // TODO: formula
}

public enum NotionPagePropertyType: String, Decodable {
    case title, number, select, date, formula, relation, rollup, people, file, checkbox, url, email
    
    case richText = "rich_text"
    case multiSelect = "multi_select"
    case phoneNumber = "phone_number"
    case createdTime = "created_time"
    case createdBy = "created_by"
    case lastEditedTime = "last_edited_time"
    case lastEditedBy = "last_edited_by"
}

public struct NotionSelect: Decodable {
    let id: String
    let name: String
    let color: String
}

public struct NotionDateRange: Decodable {
    let start: Date
    let end: Date
}

public struct NotionRelation: Decodable {
    let id: String
}

public struct NotionPerson: Decodable {
    let id: String
    let object: String
}
