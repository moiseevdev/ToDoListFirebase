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

        // Do any additional setup after loading the view.
    }
    
    func chekValid() -> String? {
        if firstNameTextField.text == "" ||
           lastNameTextField.text == "" ||
           emailTextField.text == "" ||
           passwordTextField.text == "" ||
           firstNameTextField.text == nil ||
           lastNameTextField.text == nil ||
           emailTextField.text == nil ||
           passwordTextField.text == nil {
            return "Please fill in all fiels"
        }
        return nil
    }

    @IBAction func registerPressed(_ sender: UIButton) {
       
        let error = chekValid()
        
        if error != nil {
            errorLabel.alpha = 1
            errorLabel.text = error
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil {
                   self.errorLabel.text = "\(error?.localizedDescription)"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "fistname": self.firstNameTextField.text!,
                        "lastname": self.lastNameTextField.text!,
                        "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil{
                            self.errorLabel.text = "Error saving user"
                        }
                    }
                    
                    
                    print("Jump to next screen")
                }
            }
        }
        
    }
    
}
