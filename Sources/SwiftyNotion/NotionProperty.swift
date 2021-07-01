//
//  NotionProperty.swift
//  
//
//  Created by James Saeed on 2021-07-01.
//

import Foundation

protocol NotionProperty: Identifiable, Decodable {
    
}

enum NotionPropertyType: String, Decodable {
    case title
    case richText
}

struct PropertyTitle {
    let id: String
}
