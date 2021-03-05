//
//  ViewController.swift
//  ToDoListFirebase
//
//  Created by Андрей Моисеев on 24.02.2021.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0
    }
    

    @IBAction func loginTapped(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                print("Invalid password / No such user exists")
            } else {
                self.performSegue(withIdentifier: "detailSegue", sender: nil)
            }
        }
        
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

