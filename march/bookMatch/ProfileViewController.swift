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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(VerticalView(frame: self.view.bounds))
        nameTextLabel.text = signUpViewController.getFullName()
        universityTextLabel.text = signUpViewController.getUniversityName()
        emailTextLabel.text = signUpViewController.getUniversityEmail()
        locationTextLabel.text = signUpContController.getLocation()
        // Do any additional setup after loading the view.
    }
}

class VerticalView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let customYellow = UIColor(red: 250/255, green: 236/255, blue: 92/255, alpha: 1)
        let bottomRect = CGRect(x: 0, y: rect.size.height / 3, width: rect.size.width, height: (rect.size.height / 3) * 2)
        customYellow.set();
        guard let bottomContext = UIGraphicsGetCurrentContext() else { return }
        bottomContext.fill(bottomRect)
        
        let topRect = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height / 3)
        UIColor.white.set()
        guard let topContext = UIGraphicsGetCurrentContext() else { return }
        topContext.fill(topRect)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
