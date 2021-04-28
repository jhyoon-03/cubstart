//
//  ProfileViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 3/6/21.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    var signUpViewController = SignUpViewController()
    var signUpContController = SignUpContViewController()
    var ref = DatabaseReference()
    
    var userInfo: [String: String] = [:]

    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var nameTextLabel: UILabel!
    
    @IBOutlet weak var universityTextLabel: UILabel!
    
    @IBOutlet weak var emailTextLabel: UILabel!
    
    @IBOutlet weak var locationTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
//        let user = Auth.auth().currentUser
        fillData()
        fillProfile()
        //self.view.addSubview(VerticalView(frame: self.view.bounds))
//        nameTextLabel.text = signUpViewController.getFullName()
//        universityTextLabel.text = signUpViewController.getUniversityName()
//        emailTextLabel.text = user?.email
//        locationTextLabel.text = signUpContController.getLocation()
        // Do any additional setup after loading the view.
        
        // Displays empty words if from Login page
        if nameTextLabel.text == "" {
            nameTextLabel.text = "Empty Name"
        }
        if universityTextLabel.text == "" {
            universityTextLabel.text = "Empty University"
        }
        // TO DO: assign email text label to "Empty Email"
        if locationTextLabel.text == "" {
            locationTextLabel.text = "Empty City, State"
        }
        
        // TO DO: assign profilePhoto to a default image
        // TO DO: profilePhoto should be uploadable by user
    }
    
    @IBAction func bellButton(_ sender: Any) {
    }
    
    @IBAction func cartButton(_ sender: Any) {
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        signOut()
    }
    
    func signOut() {
        do {
          try Auth.auth().signOut()
        } catch {
          print("Sign out error")
        }
    }
    
    func fillData() {
        let db = Firestore.firestore()

        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            for document in documents {
                if (document.isEqual(Auth.auth().currentUser?.uid)) {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let university = data["university"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                            
                    self.userInfo.updateValue(name, forKey: "name")
                    self.userInfo.updateValue(email, forKey: "email")
                    self.userInfo.updateValue(university, forKey: "university")
                    self.userInfo.updateValue(location, forKey: "location")
                }
            }
            
        }
    }
    
    func fillProfile() {
        nameTextLabel.text = self.userInfo["name"]
        universityTextLabel.text = self.userInfo["university"]
        emailTextLabel.text = self.userInfo["email"]
        locationTextLabel.text = self.userInfo["location"]
        
    }
 
}

/*
 This class is an attempt to split the background color to make the design similar to our Figma file,
but I am not able to get the buttons/labels to show up on top yet
 */
class VerticalView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let customYellow = UIColor(red: 251/255, green: 239/255, blue: 87/255, alpha: 1)
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
