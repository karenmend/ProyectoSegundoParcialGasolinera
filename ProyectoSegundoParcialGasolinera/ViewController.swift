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
    
    @IBOutlet weak var tv_Autos: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tv_Autos.dataSource = self
        tv_Autos.delegate = self
        
       
    }
    
    func createArray() -> [Auto]{
       var tempLista : [Auto] = []
        let L1 = Auto(placa: "CCA-111", conductor: "Jorge Mario", marca: "KIA", modelo: "Forte", fabricacion: "2019")
        let L2 = Auto(placa: "FFF-111", conductor: "Emiliano", marca: "Ford", modelo: "Lobo", fabricacion: "2019")
        
        tempLista.append(L1)
        tempLista.append(L2)
        
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
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAutos") as? CeldaAutosController
        
        let list = Autos[indexPath.row]
        
        celda?.set(Modelo : list)
        
        return celda!
    }
    
    
}

