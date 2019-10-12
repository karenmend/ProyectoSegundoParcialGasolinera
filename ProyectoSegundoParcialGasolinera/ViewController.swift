//
//  ViewController.swift
//  ProyectoSegundoParcialGasolinera
//
//  Created by Alumno on 10/8/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Autos : [Auto] = []
    
    var Fila : Int?
    
    @IBOutlet weak var tv_Autos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv_Autos.dataSource = self
        tv_Autos.delegate = self
        
       Autos = createArray()
    }
    
    func createArray() -> [Auto]{
       var tempLista : [Auto] = []
    var tempCarga : [Carga] = []
        tempCarga.append(Carga(cantidad: "5", litros: "10"))
        //let L1 = Auto(placa: "CCA-111", conductor: "Jorge Mario", marca: "KIA", modelo: "Forte", fabricacion: "2019")
        //let L2 = Auto(placa: "FFF-111", conductor: "Emiliano", marca: "Ford", modelo: "Lobo", fabricacion: "2019")
        let L3 = Auto(placa: "CCA-111", conductor: "Jorge Mario", marca: "KIA", modelo: "Forte", fabricacion: "2019", Cargas: tempCarga)
        
        tempLista.append(L3)
        //tempLista.append(L2)
        
        return tempLista
    }

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Autos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAutos") as! CeldaAutosController
        
        let list = Autos[indexPath.row]
        
        celda.set(Modelo : list)
        
        return celda
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNuevoAuto" {
            let destino = segue.destination as? NuevoAutoCotroller
            destino?.callbackAgregar = agregar
        }
        if segue.identifier == "goToCargas" {
            let destino = segue.destination as? CargasAutos
            destino?.Data = Autos[tv_Autos.indexPathForSelectedRow!.row]
            let indexPath = tv_Autos.indexPath(for: (sender as? UITableViewCell)!)
            let listDestination = Autos[indexPath!.row]
            Fila = indexPath?.row
            destino?.Data = listDestination
            destino?.callbackEditAuto = editarTabla
        }
    }
    func editarTabla(auto: Auto){
        Autos[Fila!] = auto
        tv_Autos.reloadData()
    }
    func agregar(auto : Auto){
        Autos.append(auto)
        tv_Autos.reloadData()
    }
    
}

