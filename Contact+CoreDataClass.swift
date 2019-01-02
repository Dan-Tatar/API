//
//  Contact+CoreDataClass.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 22/12/2018.
//  Copyright © 2018 Dany. All rights reserved.
//
//

import Foundation
import CoreData


public class Contact: NSManagedObject, Codable {
    
    public required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
            let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Contact", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try container.decodeIfPresent(String.self, forKey: .uuid) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.userNumber = try container.decodeIfPresent(Int64.self, forKey: .userNumber) ?? 0

    }
    private enum CodingKeys: String, CodingKey {
        
        case uuid
        case name
        case url = "profile_url"
        case userNumber = "user_number"
        case allNumbers = "telephone_numbers"
        
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(name, forKey: .name)
        try container.encode(url, forKey: .url)
        try container.encode(userNumber, forKey: .userNumber)

    }
    //func that removes the paddings, double spaces qne new lines
    func correctPaddings(text: String) -> String {
        
        let newText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let noDoubleSpaces = newText.replacingOccurrences(of: "  ", with: " ")
        let noMultiplelines = noDoubleSpaces.replacingOccurrences(of: "\n", with: "")
        return noMultiplelines
    }
}
public extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

