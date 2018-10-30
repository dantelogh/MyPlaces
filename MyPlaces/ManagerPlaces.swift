//
//  ManagerPlaces.swift
//  MyPlaces
//
//  Created by user143004 on 10/4/18.
//  Copyright © 2018 user143004. All rights reserved.
//

import Foundation

protocol ManagerPlacesObserver {
    func onPlacesChange()
}

class ManagerPlaces {
    //Propiedades de la clase
    //Array con objetos de tipo Place
    var places: [Place] = []

    public var m_observers = Array<ManagerPlacesObserver>()

    //Constructor de la clase
    init() {
        
    }

    public func addObserver(object: ManagerPlacesObserver) {
        
    }
    
    public func UpdateObservers() {
        
    }
    
    //Singleton - Unique instance for all App
    //https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift
    //https://theswiftdev.com/2018/05/23/swift-singleton-design-pattern/
    private static var sharedManagerPlaces: ManagerPlaces = {
        var singletonManager: ManagerPlaces
        
        singletonManager = ManagerPlaces()
        
        return singletonManager
    }()
    
    class func shared() -> ManagerPlaces {
        return sharedManagerPlaces
    }


    //--- Métodos de la clase ---
    //Añadir un nuevo elemento al array
    func append(_ value: Place) {
        places.append(value)
    }
    
    //Obtener el tamaño del array
    func getCount() -> Int {
        return places.count
    }
    
    //Obtener un item del array
    func getItemAt(position: Int) -> Place {
        return places[position]
    }

    //Obtener el objeto place buscándolo por su id en el array
    //TODO: Control de su existencia
    func getItemById(id: String) -> Place {
        //https://developer.apple.com/documentation/swift/array/2994718-filter
        //https://stackoverflow.com/questions/36260439/filtering-array-of-custom-objects
        //https://applecoding.com/cursos/swift-avanzado-map-reduce-filter-funciones-avanzadas-array
        let placesResult = places.filter { $0.id == id}
        
        //Devolver el primer elemento del array resultado
        return placesResult[0]
    }

    //Eliminar un elemento del array
    //TODO: Control de su existencia
    func remove(_ value: Place) {
        var index: Int = 0

        for place in places {
            if place.id == value.id {
                places.remove(at: index)
                break
            }
            index += 1
        }
    }

}
