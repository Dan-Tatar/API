//
//  Contacts.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 04/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation


import Foundation

struct Contact: Codable {
    
    let uuid: String
    let name: String
    let url: String
    let userNumber: Int64
    let allNumbers: [Numbers]
    
    
    private enum CodingKeys: String, CodingKey {

        case uuid
        case name
        case url = "profile_url"
        case userNumber = "user_number"
        case allNumbers = "telephone_numbers"

    }


    //func that removes the paddings and double spaces
    func correctPaddings(text: String) -> String {
        
    let newText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let noDoubleSpaces = newText.replacingOccurrences(of: "  ", with: " ")
        let noMultiplelines = noDoubleSpaces.replacingOccurrences(of: "\n", with: "")
        return noMultiplelines
    }
}

//let newText = text.components(separatedBy: .whitespacesAndNewlines)
//return newText.filter { !$0.isEmpty }.joined(separator: " ")

