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
    public let number: Int?
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
    case richText, number, select, multiSelect, date, formula, relation, rollup, title, people, files, checkbox, url, email, phoneNumber, createdTime, createdBy, lastEditedTime, lastEditedBy
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
