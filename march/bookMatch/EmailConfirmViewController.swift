//
//  EmailConfirmViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit

class EmailConfirmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginToPortalButton(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: self)
    }
    

}
