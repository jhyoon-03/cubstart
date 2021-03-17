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
    @IBOutlet weak var passwordSpecialCharacterMessage: UILabel!
    @IBOutlet weak var passwordLengthMessage: UILabel!
    
    // store profile information
    static var location: String = ""
    
    // returns whether the string is a valid password containing special characters
    func isValidPasswordCharacters(_ password: String) -> Bool {
        let specialCharacters = ".*[^A-Za-z0-9].*"
        let testPassword = NSPredicate(format:"SELF MATCHES %@", specialCharacters)
        return testPassword.evaluate(with: password)
    }
    
    //returns whether the string is a valid password at least 8 characters
    func isValidPasswordLength(_ password: String) -> Bool {
        return password.count >= 8
    }
    
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
        // checks if password length is valid
        else if !isValidPasswordLength(passwordText.text!){
            passwordLengthMessage.isHidden = false
            emptyFieldErrorMessage.isHidden = true
            passwordSpecialCharacterMessage.isHidden = true
            passwordConfirmationErrorMessage.isHidden = true

        }
        // checks if password characters are valid
        else if !isValidPasswordCharacters(passwordText.text!) {
            passwordSpecialCharacterMessage.isHidden = false
            passwordLengthMessage.isHidden = true
            emptyFieldErrorMessage.isHidden = true
            passwordConfirmationErrorMessage.isHidden = true
        }
        // checks if the password and confirmation password are the same
        else if passwordText.text != confirmPasswordText.text {
            passwordConfirmationErrorMessage.isHidden = false
            emptyFieldErrorMessage.isHidden = true
            passwordSpecialCharacterMessage.isHidden = true
            passwordLengthMessage.isHidden = true
        }
        else {
            SignUpContViewController.location = cityText.text! + ", " + stateText.text!
            emptyFieldErrorMessage.isHidden = true
            passwordConfirmationErrorMessage.isHidden = true
            passwordSpecialCharacterMessage.isHidden = true
            passwordLengthMessage.isHidden = true
            performSegue(withIdentifier: "toEmailConfirm", sender: self)
        }
    }
    
    // returns the location in text field
    func getLocation() -> String {
        return SignUpContViewController.location
    }

}
