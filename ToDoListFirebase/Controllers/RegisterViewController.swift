//
//  RegisterViewController.swift
//  ToDoListFirebase
//
//  Created by Андрей Моисеев on 27.02.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
        
    }
    
    enum AuthResult {
        case success
        case failure(Error)
    }
    
    func register(email: String?, password: String?, complection: @escaping (AuthResult) -> Void) {
        
        guard Validators.isFilled(firstname: firstNameTextField.text,
                                  lastname: lastNameTextField.text,
                                  email: email,
                                  password: password) else {
            complection(.failure(AuthError.notFilled))
            return
        }
        
        guard let email = email, let password = password else {
            complection(.failure(AuthError.unknownError))
            return
        }

        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let _ = result else {
                complection(.failure(error!))
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: [
                "fistname": self.firstNameTextField.text!,
                "lastname": self.lastNameTextField.text!,
                "uid": result!.user.uid
            ]) { (error) in
                if error != nil{
                    complection(.failure(AuthError.serverError))
                }
                complection(.success)
            }
        }
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        
        register(email: emailTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            case .success:
                self.showAlert(with: "Success", and: "Are you registered")
            case .failure(let error):
                self.showAlert(with: "Error", and: error.localizedDescription)
            }
        }
        
    }
    
}


extension UIViewController {
    
    func showAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
