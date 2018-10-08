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

        //Código del ejemplo "TableViewSample"
        let view: UITableView = (self.view as? UITableView)!;
        view.delegate = self
        view.dataSource = self
    }

    //--- Métodos implementados del protocolo ---
    //Número de elementos del manager
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //Para indicar subsecciones. En nuestro caso no tenemos (devolvemos un 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Detectar pulsación de un elemento
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item Seleccionado:")
        print(indexPath.row)
    }

    //Devolver la altura de la fila situada en un posición determinada
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //let cgFloat: CGFloat = CGFloat()
        //return cgFloat

        return 100
    }
    
    //Devolver una instancia de la clase UITableViewCell que pinte la fila seleccionada
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let uiTableViewCell: UITableViewCell = UITableViewCell()
        //return uiTableViewCell

        //Código del ejemplo "TableViewSample"
        var cell: UITableViewCell
        cell = UITableViewCell()
        
        let wt: CGFloat = tableView.bounds.size.width
        
        //Add subviews to cell: UILabel and UIImageView
        var label: UILabel
        label = UILabel(frame: CGRect(x:0, y:0, width:wt, height:40))
        let fuente: UIFont = UIFont(name: "Arial", size: 20)!
        label.font = fuente
        label.numberOfLines = 4
        label.text = "HOLA"
        label.sizeToFit()
        cell.contentView.addSubview(label)
        
        //let imageIcon: UIImageView = UIImageView(image: UIImage(named:"sun.png"))
        //imageIcon.frame = CGRect(x:10, y:50, width:50, height:50)
        //cell.contentView.addSubview(imageIcon)
        
        return cell
    }

}

