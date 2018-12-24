////
////  Numbers.swift
////  EngagingTech
////
////  Created by Dan  Tatar on 04/11/2018.
////  Copyright © 2018 Dany. All rights reserved.
////
////
//import Foundation
//
//struct Numbers: Codable {
//    
//    let type: String
//    let number: String
//    
//    //func that remove paddings and adds spaces and characters at certain indexes
//    func refine() -> String {
//        
//        var initialNumber = CorrectPaddings.correctPaddings(text: number)
//        var refinedNumber = initialNumber.replacingOccurrences(of: " ", with: "")
//        refinedNumber.insert(" ", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 3))
//        refinedNumber.insert("(", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 4))
//        refinedNumber.insert(")", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 8))
//        refinedNumber.insert(" ", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 9))
//        refinedNumber.insert(" ", at: refinedNumber.index(refinedNumber.startIndex, offsetBy: 13))
//        return refinedNumber
//    }
//}
