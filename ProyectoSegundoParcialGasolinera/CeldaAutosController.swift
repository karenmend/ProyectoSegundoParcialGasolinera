//
//  CeldaAutosController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class CeldaAutosController : UITableViewCell {

    @IBOutlet weak var lbl_conductor: UILabel!
    @IBOutlet weak var lbl_fabricacion: UILabel!
    @IBOutlet weak var lbl_marca: UILabel!
    @IBOutlet weak var lbl_placa: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func set(Modelo : Auto){
        
        lbl_marca.text = Modelo.marca
        lbl_fabricacion.text = Modelo.fabricacion
        lbl_conductor.text = Modelo.conductor
        lbl_placa.text = Modelo.placa
        
    }


}
