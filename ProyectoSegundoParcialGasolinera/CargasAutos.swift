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
    
    var Cargas : [Carga] = []
    
    var Autos : [Auto] = []
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cargas.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCarga") as? CeldaCargasController
        let list = Cargas[indexPath.row]
        /*celda?.lbl_Costo.text = Data?.Cargas[lafila]?.cantidad
        celda?.lbl_litros.text = Data?.Cargas[lafila]?.litros*/
        celda?.set(Modelo : list)
        return celda!
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
                self.Cargas.remove(at: indexPath.row)
                self.Data?.Cargas.remove(at: indexPath.row)
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
            let NuevoMode = Auto(placa: tf_placa.text!, conductor: tf_conductor.text, marca: tf_marca.text, modelo: tf_modelo.text , fabricacion: tf_fabricacion.text, Cargas: Cargas, img_carro: "67994")
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
        
        self.title = Data?.placa
        state = false
        
        tf_placa.text = Data?.placa
        tf_marca.text = Data?.marca
        tf_modelo.text = Data?.modelo
        tf_conductor.text = Data?.conductor
        tf_fabricacion.text = Data?.fabricacion
        
        tv_CargasAutos.dataSource = self
        tv_CargasAutos.delegate = self
        //DEBUG
        /*print(Data?.Cargas[lafila!]?.cantidad! ?? lafila!)
        print(Data?.Cargas[lafila!]?.litros! ?? lafila!)
        */
       

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNuevaCarga"{
            let destino = segue.destination as? NuevaCargaController
            destino?.callbackAgregarCarga = agregar
            destino?.placa = Data?.placa
            
        }
    }
    
    func  agregar(carga : Carga) {
        Cargas.append(carga)
        Data?.Cargas.append(carga)
        tv_CargasAutos.reloadData()
    }
    
}
