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
    
    static var location: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        SignUpContViewController.location = cityText.text! + ", " + stateText.text!
        performSegue(withIdentifier: "toEmailConfirm", sender: self)
        
    }
    
    func getLocation() -> String {
        return SignUpContViewController.location
    }

}
