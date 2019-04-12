//
//  PaymentViewController.swift
//  Shopping app
//
//  Created by Jesús Germán Ortiz Barajas D3 on 3/29/19.
//  Copyright © 2019 germanco. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    var shoppingCar = ShoppingCar()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //Payment button setup
        paymentButton.backgroundColor = UIColor.navBarRed()
        paymentButton.tintColor = .white
        paymentButton.layer.cornerRadius = 10
        
        if isEmpty(){
            totalLabel.isHidden = true
            tableView.isHidden = true
            paymentButton.isHidden = true
            titleLabel.text = "Aún no tienes productos"
            let imageView = UIImageView(image: UIImage(named: "sad"))
            imageView.frame.origin.x = view.center.x - imageView.frame.width/2
            imageView.frame.origin.y = view.center.y - imageView.frame.height/2
            self.view.addSubview(imageView)
            titleLabel.frame.origin.x = view.center.x - titleLabel.frame.width/2
            titleLabel.frame.origin.y = view.center.y - titleLabel.frame.height/2 - imageView.frame.height
            
        }
        
        //Get total price for all the products
        totalLabel.tintColor = UIColor.green
        getPrice(shoppingCar: self.shoppingCar)
    }
    
    //Custom function to delete products from shopping car
    @IBAction func deleteProduct(_ sender: UIButton) {
        let buttonPosition = sender.convert(sender.bounds.origin, to: tableView)
        let indexPath = tableView.indexPathForRow(at: buttonPosition)!
        
        //Adding alert to confirm product delete
        let alert = UIAlertController(title: "Eliminar producto", message: "¿Deseas eliminar este producto del carrito?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.shoppingCar.products.remove(at: indexPath.row)
            self.tableView.reloadData()
            self.getPrice(shoppingCar: self.shoppingCar)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func isEmpty()-> Bool{
        var isEmpty = true
        if(shoppingCar.products.count > 0){
            isEmpty = false
        }
        return isEmpty
    }
    
    func getPrice(shoppingCar: ShoppingCar){
        var total = 0.0
        for product in shoppingCar.products{
            total += product.price
            totalLabel.text = "Total $" + String(total)
        }
    }
    
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCar.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell") as! PaymentTableViewCell
        cell.PaymentImageView.image = UIImage(named: shoppingCar.products[indexPath.row].image)
        cell.PaymentLabel.text = shoppingCar.products[indexPath.row].model
        cell.priceLabel.text = "$" + String(shoppingCar.products[indexPath.row].price)
        cell.removeButton.setImage(UIImage(named: "rem"), for: .normal)
        cell.removeButton.imageView?.contentMode = .scaleAspectFit
        cell.removeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        cell.removeButton.tintColor = UIColor.red
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(125)
        return height
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.shoppingCar.products.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}


class PaymentTableViewCell: UITableViewCell{
    @IBOutlet weak var PaymentImageView: UIImageView!
    @IBOutlet weak var PaymentLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
}
