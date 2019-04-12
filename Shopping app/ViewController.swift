//
//  ViewController.swift
//  Shopping app
//
//  Created by Jesús Germán Ortiz Barajas on 3/24/19.
//  Copyright © 2019 germanco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var shoppingTableView: UITableView!
    @IBOutlet weak var shoppingButton: UIButton!
    
    var products = [Sneakers]()
    var product = Sneakers()
    let shoppingCar = ShoppingCar()
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingTableView.delegate = self
        shoppingTableView.dataSource = self
        shoppingTableView.backgroundColor = .clear
        products = getSneakers()
        
        //goPayment button settings
        shoppingButton.tintColor = .white
        shoppingButton.layer.cornerRadius = 10
        shoppingButton.backgroundImage
        shoppingButton.setImage(UIImage(named: "buy"), for: .normal)
        shoppingButton.titleLabel?.text = "Prro"
        
        
        
    }
    
    //Function to get all the sneakers available in the shopping app
    func getSneakers() -> [Sneakers]{
        var sneakers = [Sneakers]()
        let nyjah = Sneakers(model: "SB Nyjah free", brand: "Nike", description: "El Nike SB Nyjah Free, el primer calzado exclusivo del skater Nyjah Huston, ofrece el agarre óptimo de la parte superior de goma y el ajuste ceñido de la funda interior. Diseñado teniendo en cuenta la flexibilidad y el período de adaptación mínimo te permite practicar skateboarding más días.", price: 1999, image: "nyjah")
        let janoski = Sneakers(model: "SB Stefan Janoski Max", brand: "Nike", description: "El Nike SB Stefan Janoski Max incorpora un diseño ligero y transpirable diseñado estratégicamente para flexionarse con el pie. Incorpora una unidad Max Air y una plantilla de espuma para brindar una mayor comodidad y amortiguación sobre la tabla.", price: 2349, image:"janoski")
        let max = Sneakers(model: "Air Max 1", brand: "Nike", description: "El modelo clásico de 1987 está de regreso con el calzado para hombre Nike Air Max 1 para continuar la tradición de amortiguación que puedes ver y sentir. El calzado para hombre Nike Air Max 1 actualiza el diseño legendario con nuevos colores y materiales a la vez que mantiene la misma amortiguación ligera del modelo original.", price: 1500, image:"max")
        let yeezy = Sneakers(model: "Red December Yeezy 350 V2", brand: "Adidas", description: "Introducing the Red December Yeezy! Each pair handcrafted with a soft sueded, red crocodile leather upper on a dip-dyed, candy red 350 V2 sole. Designed by The Shoe Surgeon", price: 4000, image:"yeezy")
        
        sneakers.append(yeezy)
        sneakers.append(max)
        sneakers.append(janoski)
        sneakers.append(nyjah)
        return sneakers
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.viewController = self
            detailViewController.product = self.product
        }
        
        if segue.identifier == "PaymentSegue"{
            let paymentViewController = segue.destination as! PaymentViewController
            paymentViewController.shoppingCar = self.shoppingCar
        }
    }
    
    @IBAction func goPayment(_ sender: UIButton) {
        performSegue(withIdentifier: "PaymentSegue", sender: self)
    }
    

    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductTableViewCell
        
        let product = products[indexPath.row]
        cell.imageViewProduct.image = UIImage(named: product.image)
        cell.modelLabel.text = product.model
        cell.brandLabel.text = product.brand
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(250)
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        product = products[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: self)
        
    }
    
    
    
}

class ProductTableViewCell: UITableViewCell{
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
}
