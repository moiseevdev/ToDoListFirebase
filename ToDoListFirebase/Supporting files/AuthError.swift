//
//  AuthError.swift
//  ToDoListFirebase
//
//  Created by Андрей Моисеев on 05.03.2021.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case unknownError
    case serverError
}

extension AuthError: LocalizedError{
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Please fill in all fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Email is not valid", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
}

