//
//  SignUpViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var universityNameText: UITextField!
    @IBOutlet weak var universityEmailText: UITextField!
    
    static var fullNameText: String = ""
    static var universityName: String = ""
    static var universityEmail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueTapped(_ sender: Any) {
        SignUpViewController.fullNameText = firstNameText.text! + " " + lastNameText.text!
        SignUpViewController.universityName = universityNameText.text!
        SignUpViewController.universityEmail = universityEmailText.text!
        performSegue(withIdentifier: "toSignUpCont", sender: self)
    }
    
    func getFullName() -> String {
        return SignUpViewController.fullNameText
    }
    
    func getUniversityName() -> String {
        return SignUpViewController.universityName
    }
    
    func getUniversityEmail() -> String {
        return SignUpViewController.universityEmail
    }

}
