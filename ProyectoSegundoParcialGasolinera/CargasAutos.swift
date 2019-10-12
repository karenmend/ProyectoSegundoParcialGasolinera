//
//  CargasAutos.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/11/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class CargasAutos : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //var Cargas : [Carga] = []
    
    var Autos : [Auto] = []
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Autos.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCarga") as? CeldaCargasController
        //let list = Autos[indexPath.row]
        
        celda?.lbl_Costo.text = Autos[indexPath.row].Cargas[indexPath.row]?.cantidad
        celda?.lbl_litros.text = Autos[indexPath.row].Cargas[indexPath.row]?.litros
        
        return celda!
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
                self.Autos.remove(at: indexPath.row)
                self.tv_CargasAutos.reloadData()
        }
    }
    
    @IBOutlet weak var tv_CargasAutos: UITableView!
    @IBAction func editar_auto(_ sender: Any) {
        if state == false {
            tf_placa.isEnabled = true
            tf_fabricacion.isEnabled = true
            tf_conductor.isEnabled = true
            tf_modelo.isEnabled = true
            tf_marca.isEnabled = true
            state = true
        }
        else{
            let NuevoMode = Auto(placa: tf_placa.text!, conductor: tf_conductor.text, marca: tf_marca.text, modelo: tf_modelo.text , fabricacion: tf_fabricacion.text)
            callbackEditAuto!(NuevoMode)
            state = false
            navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    var Data : Auto?
    var state : Bool?
    var callbackEditAuto : ((Auto) -> Void)?
    
    
    @IBOutlet weak var tf_fabricacion: UITextField!
    @IBOutlet weak var tf_modelo: UITextField!
    @IBOutlet weak var tf_marca: UITextField!
    @IBOutlet weak var tf_conductor: UITextField!
    @IBOutlet weak var tf_placa: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state = false
        
        tf_placa.text = Data?.placa
        tf_marca.text = Data?.marca
        tf_modelo.text = Data?.modelo
        tf_conductor.text = Data?.conductor
        tf_fabricacion.text = Data?.fabricacion
        
        tv_CargasAutos.dataSource = self
        tv_CargasAutos.delegate = self

    }
    
}
