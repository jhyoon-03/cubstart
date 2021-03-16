//
//  SignUpContViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit

class SignUpContViewController: UIViewController {
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var zipcodeText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var emptyFieldErrorMessage: UILabel!
    @IBOutlet weak var passwordConfirmationErrorMessage: UILabel!
    
    // store profile information
    static var location: String = ""
    
    // check if a text field is filled out or not
    func emptyChecker(text: UITextField) -> Bool{
        return text.text == ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyFieldErrorMessage.isHidden = true
        passwordConfirmationErrorMessage.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let emptyVarCheckArray = [emptyChecker(text: cityText), emptyChecker(text: stateText), emptyChecker(text: zipcodeText), emptyChecker(text: passwordText), emptyChecker(text: confirmPasswordText)]
        // check whether or not all fields are filled in
        if emptyVarCheckArray.contains(true) {
            emptyFieldErrorMessage.isHidden = false
        }
        // checks if the password and confirmation password are the same
        else if passwordText.text != confirmPasswordText.text {
            passwordConfirmationErrorMessage.isHidden = false
            emptyFieldErrorMessage.isHidden = true
        }
        else {
            SignUpContViewController.location = cityText.text! + ", " + stateText.text!
            emptyFieldErrorMessage.isHidden = true
            passwordConfirmationErrorMessage.isHidden = true
            performSegue(withIdentifier: "toEmailConfirm", sender: self)
        }
    }
    
    // returns the location in text field
    func getLocation() -> String {
        return SignUpContViewController.location
    }

}
