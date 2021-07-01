//
//  NotionPage.swift
//  
//
//  Created by James Saeed on 2021-07-01.
//

import Foundation

struct NotionPage: NotionObject {
    let id: String
    let createdTime: String
    let lastEditedTime: String

    let archived: Bool
    
    let properties: [String: NotionPageProperty]
    
    // TODO: parent, object
}

struct NotionPageProperty: Decodable {
    let id: String
    let type: NotionPagePropertyType
    
    let title: [NotionRichText]?
    let richText: [NotionRichText]?
    let number: Int?
    let select: NotionSelect?
    let multiSelect: [NotionSelect]?
    let date: NotionDateRange?
    let relation: NotionRelation?
    let people: [NotionPerson]?
    let checkbox: Bool?
    let url: String?
    let email: String?
    let phoneNumber: String?
    
    // TODO: formula
}

enum NotionPagePropertyType: String, Decodable {
    case richText, number, select, multiSelect, date, formula, relation, rollup, title, people, files, checkbox, url, email, phoneNumber, createdTime, createdBy, lastEditedTime, lastEditedBy
}

struct NotionSelect: Decodable {
    let id: String
    let name: String
    let color: String
}

struct NotionDateRange: Decodable {
    let start: Date
    let end: Date
}

struct NotionRelation: Decodable {
    let id: String
}

struct NotionPerson: Decodable {
    let id: String
    let object: String
}
