//
//  ViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var invalidErrorMessage: UILabel!
    
    override func viewDidLoad() {
        if isUserLoggedIn() {
            performSegue(withIdentifier: "toTabBar", sender: self)
        }
        super.viewDidLoad()
        invalidErrorMessage.isHidden = true
    }

    // check if a text field is filled out or not
    func emptyChecker(text: UITextField) -> Bool{
        return text.text == ""
    }
    
    // check if user is already logged in
    func isUserLoggedIn() -> Bool {
      return Auth.auth().currentUser != nil
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if emptyChecker(text: usernameText) || emptyChecker(text: passwordText) {
            invalidErrorMessage.isHidden = false
        }
        else {
            let email = usernameText.text!
            let password = passwordText.text!
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .operationNotAllowed: break
                  // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
                case .userDisabled: break
                  // Error: The user account has been disabled by an administrator.
                case .wrongPassword: break
                  // Error: The password is invalid or the user does not have a password.
                case .invalidEmail: break
                  // Error: Indicates the email address is malformed.
                default:
                    print("Error: \(error.localizedDescription)")
                }
              } else {
                print("User signs in successfully")
                let userInfo = Auth.auth().currentUser
                let email = userInfo?.email
              }
            }
            invalidErrorMessage.isHidden = true
            performSegue(withIdentifier: "toTabBar", sender: self)
            //performSegue(withIdentifier: "toProfile", sender: self)
            //The toProfile segue is now unneccessary since we want to segue to the tab bar controller but I will leave it here in case the tab bar idea does not work
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    
}

