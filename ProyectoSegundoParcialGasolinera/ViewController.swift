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
        self.title = "Automóviles"
        
        
    }
    
    func createArray() -> [Auto]{
       var tempLista : [Auto] = []
    var tempCarga : [Carga] = []
        tempCarga.append(Carga(cantidad: "5", litros: "10"))
        tempCarga.append(Carga(cantidad: "8", litros: "0"))
        let L3 = Auto(placa: "CCA-111", conductor: "Jorge Mario", marca: "KIA", modelo: "Forte", fabricacion: "2019", Cargas : tempCarga, img_carro: "67994")
        
        tempLista.append(L3)
       
        
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
            //destino?.createCargas(fila: Fila)
            let listDestination = Autos[indexPath!.row]
            Fila = indexPath?.row
            destino?.Cargas = Autos[indexPath!.row].Cargas as! [Carga]
            
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

