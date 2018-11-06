//
//  FixPaddings.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 05/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation

class CorrectPaddings {
    
   static  func correctPaddings(text: String) -> String {
        
        let newText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let noDoubleSpaces = newText.replacingOccurrences(of: "  ", with: " ")
        let noMultiplelines = noDoubleSpaces.replacingOccurrences(of: "\n", with: "")
        return noMultiplelines
    }
}
