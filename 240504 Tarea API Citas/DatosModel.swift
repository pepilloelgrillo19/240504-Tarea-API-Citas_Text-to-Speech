//
//  DatosModel.swift
//  240504 Tarea API Citas
//
//  Created by Luis on 4/5/24.
//

import Foundation

struct Datos: Decodable {
    
    var content : String
    var author : String
    var length : Int
    var dateAdded : String

}
