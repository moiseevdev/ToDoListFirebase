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
    
//    func displayWarningLabel(withText text: String) {
//        errorLabel.text = text
//
//        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in
//            self?.errorLabel.alpha = 1
//        }) { [weak self] complete in
//            self?.errorLabel.alpha = 0
//        }
//
//    }

    @IBAction func loginTapped(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                print("net takogo pol'zovatelya")
            } else {
                print("next view!")
            }
        }
        
//        guard let email = emailTextField.text,
//              let password = passwordTextField.text,
//              email != "",
//              password != ""
//        else {
//            displayWarningLabel(withText: "Error")
//            return
//        }
//
//       Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//       guard let strongSelf = self else { return }
//      // ...
//        }
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

