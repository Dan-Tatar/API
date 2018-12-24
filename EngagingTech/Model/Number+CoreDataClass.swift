//
//  Number+CoreDataClass.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 22/12/2018.
//  Copyright © 2018 Dany. All rights reserved.
//
//

import Foundation
import CoreData


public class Number: NSManagedObject {

    func refine() -> String {
        
        var initialNumber = CorrectPaddings.correctPaddings(text: number ?? "")
        var refinedNumber = initialNumber.replacingOccurrences(of: " ", with: "")
        refinedNumber.insert(" ", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 3))
        refinedNumber.insert("(", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 4))
        refinedNumber.insert(")", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 8))
        refinedNumber.insert(" ", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 9))
        refinedNumber.insert(" ", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 13))
        return refinedNumber
    }
}
