//
//  Autos.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Auto{
    var placa : String
    var conductor : String?
    var marca : String?
    var modelo : String?
    var fabricacion : String?
    var Cargas : [Carga?] = []
    var img_carro : String?
    
    
    init (placa : String, conductor : String?, marca : String?, modelo : String?, fabricacion : String?, Cargas : [Carga?] = [], img_carro : String?){
        self.placa = placa
        
        if let M_conductor = conductor{
            self.conductor = M_conductor
        }
        if let M_marca = marca{
            self.marca = M_marca
        }
        if let M_modelo = modelo{
            self.modelo = M_modelo
        }
        if let M_fabricacion = fabricacion{
            self.fabricacion = M_fabricacion
        }
        if let M_Cargas : [Carga] = Cargas as? [Carga]{
        self.Cargas = M_Cargas
        }
        if let M_img_carro : String? = img_carro{
            self.img_carro = M_img_carro
        }
    }
    
 }
