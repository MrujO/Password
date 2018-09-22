//
//  PasswordsViewController.swift
//  Password
//
//  Created by Murillo R. Araujo on 2018-09-18.
//  Copyright © 2018 Code In Capsule. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberPasswords: Int = 1
    var numberChar: Int = 10
    var useNumbers: Bool!
    var useLowercase: Bool!
    var useUppercase: Bool!
    var useSpecialChar: Bool!
    
    var passwordGenerator: PasswordGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total of Passwords: \(numberPasswords)"
        passwordGenerator = PasswordGenerator(numberChar: numberChar, useLowercase: useLowercase, useUppercase: useUppercase, useSpecialChar: useSpecialChar, useNumbers: useNumbers)
        
        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.text = ""
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        let passwords = passwordGenerator.generate(total: numberPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
}
