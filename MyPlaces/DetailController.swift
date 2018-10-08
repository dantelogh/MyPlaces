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
    //Label para visualizar la propiedad "name" del Place seleccionado
    @IBOutlet weak var namePlace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Necesario para la opción "constraintHeight"...¿?
        self.constraintHeight.constant = 400

        // Do any additional setup after loading the view.

        //print(place?.name ?? "Hola")
        self.namePlace.text = "Name: " + (place?.name)!
    }
    
    //Evento click del botón "Close"
    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
