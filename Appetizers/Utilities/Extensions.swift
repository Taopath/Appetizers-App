//
//  Extensions.swift
//  Appetizers
//
//  Created by Nikita Alexander on 07/06/2024.
//

import Foundation
import RegexBuilder

extension String {
    
    //Extension for e-mail validation
    var isValidEmail : Bool {
        
        if #unavailable(iOS 16.0) {
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
            return emailPredicate.evaluate(with: self)
        }

        let emailRegex  = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf(".-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...64) {
                CharacterClass(
                    ("A"..."Z"),
                    ("a"..."z")
                )
            }
        }
        
        return self.wholeMatch(of: emailRegex) != nil
    }
}

extension Date {
    
    var eitghteenYearsAgo: Date {
        return Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    }
    
    var twoHundredYearsAgo: Date {
        return Calendar.current.date(byAdding: .year, value: -200, to: Date())!
    }
    
}
