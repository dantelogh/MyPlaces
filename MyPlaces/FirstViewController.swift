//
//  FirstViewController.swift
//  MyPlaces
//
//  Created by user143004 on 10/1/18.
//  Copyright © 2018 user143004. All rights reserved.
//

import UIKit

//Se ha modificado el protocolo en la PLA 1
//https://applecoding.com/analisis/programacion-orientada-protocolos-evolucion-swift-2
//https://applecoding.com/cursos/swift-leccion-8-protocolos
//class FirstViewController: UIViewController {
class FirstViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //--- Métodos implementados del protocolo ---
    //Número de elementos del manager
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //Para indicar subsecciones. En nuestro caso no tenemos (devolvemos un 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Detectar pulsación de un elemento
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    //Devolver la altura de la fila situada en un posición determinada
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
    
    //Devolver una instancia de la clase UITableViewCell que pinte la fila seleccionada
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}

