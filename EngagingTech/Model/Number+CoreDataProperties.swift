//
//  Number+CoreDataProperties.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 23/12/2018.
//  Copyright © 2018 Dany. All rights reserved.
//
//

import Foundation
import CoreData


extension Number {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Number> {
        return NSFetchRequest<Number>(entityName: "Number")
    }

    @NSManaged public var type: String?
    @NSManaged public var number: String?
//    @NSManaged public var numbers: Contact?

}
