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

    let title: [NotionRichText]
    let archived: Bool
    
    // TODO: parent, properties, object
}
