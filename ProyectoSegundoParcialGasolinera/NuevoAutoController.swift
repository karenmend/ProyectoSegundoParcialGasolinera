//
//  NuevoAutoController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class NuevoAutoCotroller : UIViewController{
    
    var callbackAgregar : ((Auto) -> Void)?
   
    @IBOutlet weak var txt_fabricacion: UITextField!
    @IBOutlet weak var txt_modelo: UITextField!
    @IBOutlet weak var txt_marca: UITextField!
    @IBOutlet weak var txt_conductor: UITextField!
    @IBOutlet weak var txt_placa: UITextField!
    
    @IBAction func doTapGuardar(_ sender: Any) {
        let auto = Auto(placa: txt_placa.text!, conductor: txt_conductor.text! , marca: txt_marca.text! , modelo: txt_modelo.text!, fabricacion: txt_fabricacion.text!, img_carro: "67994")
        callbackAgregar!(auto)
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        self.title = "Nuevo auto"
    }
    
}
