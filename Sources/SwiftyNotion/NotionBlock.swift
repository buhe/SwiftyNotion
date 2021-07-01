//
//  NotionBlock.swift
//  
//
//  Created by James Saeed on 2021-06-30.
//

import Foundation

struct NotionBlock: NotionObject {
    let id: String
    let createdTime: String
    let lastEditedTime: String
    
    let type: BlockType
    
    let paragraph: BlockParagraph?
    let heading1: BlockHeading1?
    let heading2: BlockHeading2?
    let heading3: BlockHeading3?
    let bulletedListItem: BlockBulletedListItem?
    let numberedListItem: BlockNumberedListItem?
    let toDo: BlockToDo?
    let toggle: BlockToggle?
    let childPage: BlockPage?
}

enum BlockType: String, Decodable {
    case paragraph, heading1, heading2, heading3, bulletedListItem, numberedListItem, toDo, toggle, childPage, unsupported
}

struct BlockParagraph: Decodable {
    let text: [NotionRichText]
    let children: [NotionBlock]
}

struct BlockHeading1: Decodable {
    let text: [NotionRichText]
}

struct BlockHeading2: Decodable {
    let text: [NotionRichText]
}

struct BlockHeading3: Decodable {
    let text: [NotionRichText]
}

struct BlockBulletedListItem: Decodable {
    let text: [NotionRichText]
    let children: [NotionBlock]
}

struct BlockNumberedListItem: Decodable {
    let text: [NotionRichText]
    let children: [NotionBlock]
}

struct BlockToDo: Decodable {
    let text: [NotionRichText]
    let children: [NotionBlock]
    let checked: Bool?
}

struct BlockToggle: Decodable {
    let text: [NotionRichText]
    let children: [NotionBlock]
}

struct BlockPage: Decodable {
    let title: String
}
