//
//  ShopViewController.swift
//  bookMatch
//
//  Created by Haroun Khaleel on 4/4/21.
//

import UIKit

//Each product retrieved from the database is displayed in a ShopTableViewCell in the ShopViewController
class ShopTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var isbnLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    //When the user taps on the cell, the application will take them to the product page for that product
    @IBAction func selectProduct(_ sender: Any) {
    }
}

//The view controller for the show page of the application
class ShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Displays academics, recruitment, and recreational most trending books (view Figma)
    @IBOutlet weak var trendTable: UITableView!
    
    @IBOutlet weak var shopSearchBar: UISearchBar!
    
    
    @IBAction func bellButton(_ sender: Any) {
    }
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "toItemFocusView", sender: self)
    }
    
    @IBAction func cartButton(_ sender: Any) {
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
