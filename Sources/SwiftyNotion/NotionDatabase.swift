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
    
//    let properties: Properties
    
    // TODO: parent, properties, object
}

