//
//  NotionIdentifiable.swift
//  
//
//  Created by James Saeed on 2021-06-30.
//

import Foundation

protocol NotionObject: Identifiable, Decodable {
    
    var id: String { get }
    // TODO: add date formatability when doing the decoder
    var createdTime: String { get }
    var lastEditedTime: String { get }
}
