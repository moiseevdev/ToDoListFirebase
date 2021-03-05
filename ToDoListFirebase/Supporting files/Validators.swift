//
//  Validators.swift
//  ToDoListFirebase
//
//  Created by Андрей Моисеев on 04.03.2021.
//

import Foundation

class Validators {
    
    static func isFilled(firstname: String?, lastname: String?, email: String?, password: String?) -> Bool {
        guard !(firstname ?? "").isEmpty,
              !(firstname ?? "").isEmpty,
              !(firstname ?? "").isEmpty,
              !(firstname ?? "").isEmpty
        else {
            return false
        }
        return true
    }

    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
    
}
