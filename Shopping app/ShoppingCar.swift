//
//  ShoppingCar.swift
//  Shopping app
//
//  Created by Jesús Germán Ortiz Barajas D3 on 3/29/19.
//  Copyright © 2019 germanco. All rights reserved.
//

import Foundation

class ShoppingCar{
    var products = [Sneakers]()
    var totalPrice : Double = 0.0
    
    func addProduct(sneakers : Sneakers){
        self.products.append(sneakers)
    }
    
}
