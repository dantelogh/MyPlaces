//
//  DetailController.swift
//  MyPlaces
//
//  Created by user143004 on 10/1/18.
//  Copyright © 2018 user143004. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    //Necesario para la opción "constraintHeight"...¿?
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    //Para pintar el Place enviado desde los ViewController
    var place: Place? = nil
    //PickerView para visualizar/editar la propiedad "type" del Place seleccionado
    @IBOutlet weak var typePlace: UIPickerView!
    //TextField para visualizar/editar la propiedad "name" del Place seleccionado
    @IBOutlet weak var namePlace: UITextField!
    //Image para visualizar/editar la propiedad "image" del Place seleccionado
    @IBOutlet weak var imagePlace: UIImageView!
    //TextField para visualizar/editar la propiedad "description" del Place seleccionado
    @IBOutlet weak var descriptionPlace: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Necesario para la opción "constraintHeight"...¿?
        self.constraintHeight.constant = 400

        // Do any additional setup after loading the view.

        //print(place?.name ?? "Hola")
        self.namePlace.text = place?.name
        self.descriptionPlace.text = place?.description
    }
    
    //Evento click del botón "Cancel"
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    //Evento click del botón "Update"
    @IBAction func Update(_ sender: Any) {
        //TODO actualizar Place
    }

    //Evento click del botón "Remove"
    @IBAction func Remove(_ sender: Any) {
        //TODO Eliminar Place
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
