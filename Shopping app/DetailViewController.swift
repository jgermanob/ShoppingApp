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
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarButton()
        brandLabel.text = product.brand
        productImageView.image = UIImage(named: product.image)
        modelLabel.text = product.model
        descriptionTextView.text = product.description
        priceLabel.text = "$" + String(product.price)
        
        
    }
    
    func setupCarButton(){
        carButton.backgroundColor = UIColor.navBarRed()
        carButton.tintColor = UIColor.white
        carButton.layer.cornerRadius = 10
    }
    
    @IBAction func addToShoppingCar(_ sender: UIButton) {
        viewController.shoppingCar.addProduct(sneakers: product)
        let alertController = UIAlertController(title: "Producto agregado", message: "Este par ha sido agregago a tu carrito de compras", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
}
