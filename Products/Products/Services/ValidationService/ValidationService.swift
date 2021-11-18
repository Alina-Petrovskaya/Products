//
//  ValidationService.swift
//  Products
//
//  Created by Alina Petrovskaya on 10.11.2021.
//

import Foundation

// MARK: - Typealiases
typealias ErrorString = String

// MARK: - Enums
enum AuthValidationType {

    case email(String)
    case password(String)
    case name(String)
    case productDescription(String)

}

// MARK: - ValidationSercice
class ValidationService {
    
    // MARK: - Private properties

    // MARK: - Public properties
    
    // MARK: - Life cycle
    
    // MARK: - Private methods
    private func validate(_ type: AuthValidationType) -> Result<Bool, ValidationError> {
        switch type {
        case .email(let email):
            let email = email.replacingOccurrences(of: " ", with: "")

            if email.count > 3 {
                let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
                if emailPredicate.evaluate(with: email) {
                    return .success(true)
                } else {
                    return .failure(.emailBadlyFormatted)
                }

            } else {
                return .failure(.shortEmail)
            }

        case .password(let password):
            if password.count >= 4 {
                return .success(true)
            } else {
                return .failure(.shortPassword)
            }

        case .name(let name):
            if name.count >= 4 {
                return .success(true)
            } else {
                return .failure(.shortName)
            }
            
        case .productDescription(let text):
            if text.count >= 10 {
                return .success(true)
            } else {
                return .failure(.shortDescription)
            }
        }
    }
    
    // MARK: - Public methods
    func validate(_ types: [AuthValidationType]) -> ErrorString? {

        let validationResult = types.compactMap { type -> Result<Bool, ValidationError> in
            return validate(type)
        }

        let errorsDescription = validationResult.reduce("") { partialResult, result in
            switch result {
            case .success:
                return partialResult
            case .failure(let error):
                return error.localizedDescription + "\n" + partialResult
            }
        }

        guard !errorsDescription.isEmpty else { return nil }
        return errorsDescription
    }
    
  
    
}
