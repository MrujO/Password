//
//  PasswordGenerator.swift
//  Password
//
//  Created by Murillo R. Araujo on 2018-09-18.
//  Copyright © 2018 Code In Capsule. All rights reserved.
//

import Foundation


class PasswordGenerator {
    
    var numberChar: Int
    var useLowercase: Bool
    var useUppercase: Bool
    var useSpecialChar: Bool
    var useNumbers: Bool
    
    var passwords: [String] = []
    
    private let lowercase = "abcdefghijklmnopqrstuvxwyz"
    private let specialChar = "!@#$%ˆ&*()_-=+˜'|]}{[´:;?/,.<>"
    private let numbers = "0123456789"
    
    init(numberChar: Int, useLowercase: Bool, useUppercase: Bool, useSpecialChar: Bool, useNumbers: Bool) {
        
        var validNumberChar = min(numberChar, 16)
        validNumberChar = max(validNumberChar, 1)
        
        self.numberChar = validNumberChar
        self.useLowercase = useLowercase
        self.useUppercase = useUppercase
        self.useSpecialChar = useSpecialChar
        self.useNumbers = useNumbers
    }
    
    func generate(total: Int) -> [String] {
        
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLowercase {
            universe += lowercase
        }
        
        if useUppercase {
            universe += lowercase.uppercased()
        }
        
        if useSpecialChar {
            universe += specialChar
        }
        
        if useNumbers {
            universe += numbers
        }
        
        var universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            
            for _ in 1...numberChar {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
