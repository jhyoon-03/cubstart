//
//  CheckoutViewController.swift
//  bookMatch
//
//  Created by Jihee Yoon on 4/13/21.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var buyerCityLabel: UILabel!
    @IBOutlet weak var sellerCityLabel: UILabel!
    
    @IBOutlet weak var finalPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Decide on pick up location
    @IBAction func confirmButton(_ sender: Any) {
    }
    @IBAction func editButton(_ sender: Any) {
    }
    
    // Receive credit card details
    @IBAction func creditCardDetailsButton(_ sender: Any) {
    }
    // Input available dates
    @IBAction func availabilityButton(_ sender: Any) {
    }
    // Place Order
    @IBAction func placeOrderButton(_ sender: Any) {
    }
    
    @IBAction func bellButton(_ sender: Any) {
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
