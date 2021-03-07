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
    
    var fullNameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        self.fullNameText = firstNameText.text!
        performSegue(withIdentifier: "toSignUpCont", sender: self)
    }
    

}
