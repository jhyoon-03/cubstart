//
//  SignUpContViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit
import Firebase

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
    
    var signUpViewController = SignUpViewController()
    let db = Firestore.firestore()
    
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
            
            let email = signUpViewController.getUniversityEmail()
            let password = passwordText.text
            Auth.auth().createUser(withEmail: email, password: password!) { [self] authResult, error in
                if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .emailAlreadyInUse: break
                  // Error: The email address is already in use by another account. Break for now but should display some sort of error message
                default:
                    print("Error: \(error.localizedDescription)")
                }
              } else {
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
                db.collection("users").document(newUserInfo!.uid).setData([
                    "name": signUpViewController.getFullName(),
                    "university": signUpViewController.getUniversityName(),
                    "location": getLocation(),
                    "email":signUpViewController.getUniversityEmail()
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
//                let ref: DatabaseReference! = Database.database().reference()
//                var userDictionary: [String: Any] = [:]
//                var dataDictionary: [String: Any] = [:]
//                dataDictionary["name"] = signUpViewController.getFullName()
//                dataDictionary["university"] = signUpViewController.getUniversityName()
//                dataDictionary["location"] = getLocation()
//                dataDictionary["email"] = signUpViewController.getUniversityEmail()
//                userDictionary[newUserInfo!.uid] = dataDictionary
//
//                ref.setValue(userDictionary)
                
//                self.ref.child("users").child(newUserInfo!.uid).setValue(["name":signUpViewController.getFullName()])
//                self.ref.child("users").child(newUserInfo!.uid).setValue(["university":signUpViewController.getUniversityName()])
//                self.ref.child("users").child(newUserInfo!.uid).setValue(["location":getLocation()])
//                self.ref.child("users").child(newUserInfo!.uid).setValue(["email":signUpViewController.getUniversityEmail()])
              }
            }
            
            
            
            
            
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
