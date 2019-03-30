//
//  DetailViewController.swift
//  Shopping app
//
//  Created by Jesús Germán Ortiz Barajas on 3/28/19.
//  Copyright © 2019 germanco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var product = Sneakers()
    var viewController = ViewController()

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var carButton: UIButton!
    var isAdded = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarButton()
        brandLabel.text = product.brand
        productImageView.image = UIImage(named: product.image)
        modelLabel.text = product.model
        descriptionTextView.text = product.description
        
    }
    
    func setupCarButton(){
        carButton.backgroundColor = UIColor.navBarRed()
        carButton.tintColor = UIColor.white
        carButton.layer.cornerRadius = 10
    }
    
    @IBAction func addToShoppingCar(_ sender: UIButton) {
        viewController.shoppingCar.addProduct(sneakers: product)
        isAdded = true
        if isAdded{
            carButton.isHidden = true
        }
    }
}
