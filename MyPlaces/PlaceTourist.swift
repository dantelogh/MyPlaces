//
//  PlaceTourist.swift
//  MyPlaces
//
//  Created by user143004 on 10/3/18.
//  Copyright © 2018 user143004. All rights reserved.
//

import Foundation

class PlaceTourist : Place {
    //Propiedades de la subclase
    var discount_tourist: String = ""

    //Métodos constructores de la clase
    override init() {
        super.init()
        type = .TouristicPlace
    }

    init(name: String, description: String, discount_tourist: String, image_in: Data?) {
        super.init(type: .TouristicPlace, name: name, description: description, image_in: image_in)
        self.discount_tourist = discount_tourist
    }

}
