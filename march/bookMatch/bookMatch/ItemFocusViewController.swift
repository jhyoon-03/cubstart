//
//  ItemFocusViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 4/13/21.
//

import UIKit

class ItemFocusViewController: UIViewController {

    @IBOutlet weak var shopSearchBar: UISearchBar!
    @IBOutlet weak var searchedBookInfo: UILabel!
    
    @IBOutlet weak var titleAndEditionLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var sellerUsernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var textbookImages: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButton(_ sender: Any) {
    }
    
    @IBAction func bellButton(_ sender: Any) {
    }
    @IBAction func cartButton(_ sender: Any) {
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
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
