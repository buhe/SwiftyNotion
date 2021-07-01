//
//  NotionRequest.swift
//  
//
//  Created by James Saeed on 2021-06-30.
//

import Foundation

enum NotionRequest {
    case retrieveDatabase(databaseId: String)
    case queryDatabase(databaseId: String)
    
    case retrievePage(pageId: String)
    
    case retrieveBlockChildren(blockId: String)
    
    var endpointPath: String {
        switch self {
        case .retrieveDatabase(let databaseId): return "/databases/\(databaseId)"
        case .queryDatabase(let databaseId): return "/databases/\(databaseId)/query"
            
        case .retrievePage(let pageId): return "/pages/\(pageId)"
            
        case .retrieveBlockChildren(let blockId): return "/block/\(blockId)/children"
        }
    }
    
    var request: HTTPRequestType {
        switch self {
        case .retrieveDatabase, .retrievePage, .retrieveBlockChildren: return .get
        case .queryDatabase: return .post
        }
    }
}

enum HTTPRequestType: String {
    case get, post, patch
}
