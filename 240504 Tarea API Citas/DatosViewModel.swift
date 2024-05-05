//
//  DatosViewModel.swift
//  240504 Tarea API Citas
//
//  Created by Luis on 4/5/24.
//

import Foundation

final class DatosViewModel:ObservableObject {
    @Published var datos:Datos?
    
    private func llamarUrlPrivada() {
        guard let url = URL(string: "https://api.quotable.io/random") else{return}
        
        //Para crear la sesión y obtener (o no) un JSON
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            //Si hemos obtenido JSON, tenemos que usar un decodificador para almacenarlo en nuestra variable datos, de tipo Datos.
            //Si descargamos un JSON, esta variable lo decodificará (con el JSONDecoder)
            if let datosDecodificados = try? JSONDecoder().decode(Datos.self,from:data){
                
                //LLenamos la variable datos
                //DispatchQueue es para poder actuar desde el hilo principal
                DispatchQueue.main.async {
                    self.datos = datosDecodificados
                }
            }
            
        }.resume()
    }
    
    //Como la función es privada, creo esta variable para poder llamarla desde fuera
    func llamaUrl(){
        llamarUrlPrivada()
    }
}
