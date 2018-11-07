//
//  Peliculas.swift
//  SearchMovie
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit

class Peliculas {
    var nombre : String
    var id : String
    var ano : String
    var duracion : String
    var rated : String
    var director :String
    var genero :   String
    var urlPoster : String
    
    init(nombre : String, id : String , ano : String ,  duracion : String, rated : String, director : String, genero : String, urlPoster : String  ) {
        self.nombre = nombre
        self.id = id
        self.ano = ano
        self.duracion = duracion
        self.rated = rated
        self.director = director
        self.genero = genero
        self.urlPoster = urlPoster
        
    }
    
}
