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
    
    var shoppingCar = ShoppingCar()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
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
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
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
}
