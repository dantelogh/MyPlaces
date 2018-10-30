//
//  DetailController.swift
//  MyPlaces
//
//  Created by user143004 on 10/1/18.
//  Copyright © 2018 user143004. All rights reserved.
//

import UIKit

class DetailController: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Listado de items del PickerView
    let pickerElements = ["Generic place", "Tourist place"]
    
    //Métodos del protocolo del PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerElements[row]
    }

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
    //ScrollView
    @IBOutlet weak var scrollView: UIScrollView!

    //Para la gestión del teclado
    var keyboardHeight:CGFloat!
    var activeField: UIView!
    var lastOffset:CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Soft keyboard Control
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector:#selector(hideKeyboard), name:UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector:#selector(showKeyboard), name:UIResponder.keyboardWillShowNotification, object: nil)

        //Necesario para la opción "constraintHeight"...¿?
        self.constraintHeight.constant = 400

        // Do any additional setup after loading the view.

        namePlace.delegate = self
        descriptionPlace.delegate = self
        
        typePlace.delegate = self
        typePlace.dataSource = self

        //TODO Comprobar que Place no es nil
        self.namePlace.text = place?.name
        self.descriptionPlace.text = place?.description
        self.typePlace.selectRow(place!.type.rawValue, inComponent: 0, animated: true)
    }

    @objc func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        activeField = textView
        lastOffset = self.scrollView.contentOffset
        
        return true
    }
    
    @objc func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        if (activeField == textView) {
            activeField?.resignFirstResponder()
            activeField = nil
        }
        
        return true
    }
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffset = self.scrollView.contentOffset
        
        return true
    }

    @objc func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (activeField == textField) {
            activeField?.resignFirstResponder()
            activeField = nil
        }
        
        return true
    }

    @objc func showKeyboard(notification: Notification) {
        if (activeField != nil) {
            let userInfo = notification.userInfo!
            let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
            keyboardHeight = keyboardViewEndFrame.size.height
            
            let distanceToBottom = self.scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
            let collapseSpace = keyboardHeight - distanceToBottom

            if collapseSpace > 0 {
                self.scrollView.setContentOffset(CGPoint(x: self.lastOffset.x, y: collapseSpace + 10), animated: false)
                self.constraintHeight.constant += self.keyboardHeight
            }
            else {
                keyboardHeight = nil
            }
        }
    }

    //Hide soft keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func hideKeyboard(notification: Notification) {
        if (keyboardHeight != nil) {
            self.scrollView.contentOffset = CGPoint(x: self.lastOffset.x, y: self.lastOffset.y)
            
            self.constraintHeight.constant -= self.keyboardHeight
        }
        keyboardHeight = nil
    }

    //Evento click del botón "Update"
    @IBAction func Update(_ sender: Any) {
        //TODO actualizar Place
        print("Update")
    }

    //Evento click del botón "Cancel"
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    //Evento click del botón "Remove"
    @IBAction func Remove(_ sender: Any) {
        //TODO Eliminar Place
        print("Remove")
    }

    //Evento click del botón "Select Image"
    @IBAction func SelectImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()

        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary;
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }

    //Métodos de los protocolos del ImagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        view.endEditing(true)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePlace.contentMode = .scaleAspectFit
        imagePlace.image = image
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated:true, completion: nil)
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
