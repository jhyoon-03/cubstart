//
//  ViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var invalidErrorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidErrorMessage.isHidden = true
    }

    // check if a text field is filled out or not
    func emptyChecker(text: UITextField) -> Bool{
        return text.text == ""
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if emptyChecker(text: usernameText) || emptyChecker(text: passwordText) {
            invalidErrorMessage.isHidden = false
        }
        else {
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

