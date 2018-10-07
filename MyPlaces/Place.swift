//
//  Place.swift
//  MyPlaces
//
//  Created by user143004 on 10/3/18.
//  Copyright © 2018 user143004. All rights reserved.
//

//https://developer.apple.com/documentation/foundation
import Foundation
//Para la clase CLLocationCoordinate2D
import MapKit

class Place {
    //Tipo enumerador
    //https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
    enum PlacesTypes {
        case GenericPlace
        case TouristicPlace
    }

    //Propiedades de la clase
    //https://developer.apple.com/documentation/corelocation/getting_the_user_s_location
    var id: String = ""
    var type: PlacesTypes = .GenericPlace
    var name: String = ""
    var description: String = ""
    var location: CLLocationCoordinate2D!
    var image: Data? = nil

    //Métodos constructores de la clase
    //https://applecoding.com/cursos/swift-leccion-3-clases-metodos-structs-herencia
    //https://docs.swift.org/swift-book/LanguageGuide/Initialization.html
    init() {
        //https://docs.swift.org/swift-book/LanguageGuide/Methods.html
        //https://developer.apple.com/documentation/foundation/uuid
        self.id = UUID().uuidString
    }

    init(name: String, description: String, image_in: Data?) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
        self.image = image_in
    }

    init(type: PlacesTypes, name: String, description: String, image_in: Data?) {
        self.id = UUID().uuidString
        self.type = type
        self.name = name
        self.description = description
        self.image = image_in
    }

}
