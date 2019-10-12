//
//  CeldaCargasController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/11/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class CeldaCargasController: UITableViewCell {

    @IBOutlet weak var lbl_litros: UILabel!
    @IBOutlet weak var lbl_Costo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(Modelo: Carga){
        //let indexPath = IndexPath.init()
        lbl_litros.text = "(" + Modelo.litros! + " litros)"
        lbl_Costo.text = "$ " + Modelo.cantidad!
        
    }

}
