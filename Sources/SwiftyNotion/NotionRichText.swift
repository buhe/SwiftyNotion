//
//  NotionRichText.swift
//  
//
//  Created by James Saeed on 2021-06-30.
//

import Foundation
import UIKit

// TODO: Support all rich text types

struct NotionRichText: Decodable {
    let type: RichTextType
    let plainText: String
    let href: String?
}

enum RichTextType: String, Decodable {
    case text, mention, equation
}

struct RichTextAnnotations: Decodable {
    let bold: Bool
    let italic: Bool
    let strikethrough: Bool
    let underline: Bool
    let code: Bool
    
    // TODO: Make this an enum
    let color: String
}

enum RichTextColor: String, Decodable {
    case gray
}
