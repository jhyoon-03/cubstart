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
    
    var fullNameText: String = ""
    var universityName: String = ""
    var universityEmail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func continueTapped(_ sender: Any) {
        fullNameText = firstNameText.text! + lastNameText.text!
        universityName = universityNameText.text!
        universityEmail = universityEmailText.text!
        performSegue(withIdentifier: "toSignUpCont", sender: self)
    }
    
    func getFullName() -> String {
        return fullNameText
    }
    
    func getUniversityName() -> String {
        return universityName
    }
    
    func getUniversityEmail() -> String {
        return universityEmail
    }

}
