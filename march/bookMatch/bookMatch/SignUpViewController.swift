//
//  SignUpViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var universityNameText: UITextField!
    @IBOutlet weak var universityEmailText: UITextField!
    @IBOutlet weak var emailErrorMessage: UILabel!
    @IBOutlet weak var emptyFieldErrorMessage: UILabel!
    
    // variables storing profile information
    static var fullNameText: String = ""
    static var universityName: String = ""
    static var universityEmail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailErrorMessage.isHidden = true
        emptyFieldErrorMessage.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    // returns whether or not the string is a berkeley email
    func isValidEmail(_ email: String) -> Bool {
        let berkeleyEmail = "[A-Z0-9a-z._%+-]+@berkeley.edu"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", berkeleyEmail)
        return testEmail.evaluate(with: email)
    }
    
    // check if a text field is filled out or not
    func emptyChecker(text: UITextField) -> Bool{
        return text.text == ""
    }


    @IBAction func continueTapped(_ sender: Any) {
        let emptyVarCheckArray = [emptyChecker(text: firstNameText), emptyChecker(text: lastNameText), emptyChecker(text: universityNameText), emptyChecker(text: universityEmailText)]
        // checks if all fields filled in
        if emptyVarCheckArray.contains(true) {
            emptyFieldErrorMessage.isHidden = false
        }
        // checks if the email is a valid berkeley email
        else if !isValidEmail(universityEmailText.text!) {
            emptyFieldErrorMessage.isHidden = true
            emailErrorMessage.isHidden = false
        }
        else {
            SignUpViewController.fullNameText = firstNameText.text! + " " + lastNameText.text!
            SignUpViewController.universityName = universityNameText.text!
            SignUpViewController.universityEmail = universityEmailText.text!
            
            emailErrorMessage.isHidden = true
            emptyFieldErrorMessage.isHidden = true
            performSegue(withIdentifier: "toSignUpCont", sender: self)
        }
    }
    
    // returns the full name from inputted text
    func getFullName() -> String {
        return SignUpViewController.fullNameText
    }
    
    // returns the university name from inputted text
    func getUniversityName() -> String {
        return SignUpViewController.universityName
    }
    
    // returns the university email from inputted text
    func getUniversityEmail() -> String {
        return SignUpViewController.universityEmail
    }

}
