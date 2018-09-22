//
//  ViewController.swift
//  Password
//
//  Created by Murillo R. Araujo on 2018-09-02.
//  Copyright © 2018 Code In Capsule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumberPasswords: UITextField!
    @IBOutlet weak var tfNumberChar: UITextField!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swLowercase: UISwitch!
    @IBOutlet weak var swUppercase: UISwitch!
    @IBOutlet weak var swSpecialChar: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        if let numberPasswords = Int(tfNumberPasswords.text!) {
            passwordsViewController.numberPasswords = numberPasswords
        }
        
        if let numberChar = Int(tfNumberChar.text!) {
            passwordsViewController.numberChar = numberChar
        }
        
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useLowercase = swLowercase.isOn
        passwordsViewController.useUppercase = swUppercase.isOn
        passwordsViewController.useSpecialChar = swSpecialChar.isOn
        view.endEditing(true)
    }
}
