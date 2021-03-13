//
//  ProfileViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit

class ProfileViewController: UIViewController {
    var signUpViewController = SignUpViewController()
    var signUpContController = SignUpContViewController()
    
    @IBOutlet weak var nameTextLabel: UILabel!
    
    @IBOutlet weak var universityTextLabel: UILabel!
    
    @IBOutlet weak var emailTextLabel: UILabel!
    
    @IBOutlet weak var locationTextLabel: UILabel!
    
    var fullName:String?
    var universityName:String?
    var universityEmail:String?
    var location:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextLabel.text = signUpViewController.getFullName()
        universityTextLabel.text = signUpViewController.getUniversityName()
        emailTextLabel.text = signUpViewController.getUniversityEmail()
        locationTextLabel.text = signUpContController.getLocation()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
