//
//  Sneakers.swift
//  Shopping app
//
//  Created by Jesús Germán Ortiz Barajas on 3/24/19.
//  Copyright © 2019 germanco. All rights reserved.
//

import Foundation

class Sneakers{
    var model : String = ""
    var brand : String = ""
    var description : String = ""
    var price : Double = 0.0
    var image : String = ""
    
     init(model: String, brand: String, description: String, price: Double, image: String) {
        self.model = model
        self.brand = brand
        self.description = description
        self.price = price
        self.image = image
    }
    
    init() {
        
    }
    

}
