//
//  NuevaCargaController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class NuevaCargaController : UIViewController{
    
    var placa : String?
    @IBOutlet weak var txt_cantidad: UITextField!
    @IBOutlet weak var txt_litros: UITextField!
    var callbackAgregarCarga : ((Carga) -> Void)?
    
    override func viewDidLoad() {
        self.title = "Nueva Carga de " + placa!
    }
    @IBAction func doTapGuardarCarga(_ sender: Any) {
        let carga =  Carga(cantidad: txt_cantidad.text!, litros: txt_litros.text!)
        callbackAgregarCarga!(carga)
        self.navigationController?.popViewController(animated: true)
    }
}
