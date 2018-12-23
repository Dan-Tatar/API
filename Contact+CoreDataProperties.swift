//
//  Contact+CoreDataProperties.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 23/12/2018.
//  Copyright © 2018 Dany. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var uuid: String?
    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var userNumber: Int64
    @NSManaged public var allNumbers: NSSet?

}

// MARK: Generated accessors for allNumbers
extension Contact {

    @objc(addAllNumbersObject:)
    @NSManaged public func addToAllNumbers(_ value: Number)

    @objc(removeAllNumbersObject:)
    @NSManaged public func removeFromAllNumbers(_ value: Number)

    @objc(addAllNumbers:)
    @NSManaged public func addToAllNumbers(_ values: NSSet)

    @objc(removeAllNumbers:)
    @NSManaged public func removeFromAllNumbers(_ values: NSSet)

}
