//
//  File.swift
//  
//
//  Created by 顾艳华 on 2/8/24.
//

import Foundation

public struct NotionCode: Decodable {
    public let rich_text: [NotionRichText]?
    public let language: String
}
