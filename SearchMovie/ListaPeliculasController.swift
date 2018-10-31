//
//  ListaPeliculasController.swift
//  SearchMovie
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ListaPeliculasController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tvPeliculas: UITableView!
    @IBOutlet weak var txtPelicula: UITextField!
    
    var urlPelicula = "https://www.omdbapi.com/?apikey=cf43d6bc&s=god"
    var pelicula : String = ""
    var encontrada : String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatosPeliculas.peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellPelicula") as! CellPeliculasController
        celda.lbltitulo.text = DatosPeliculas.peliculas[indexPath.row].nombre
        celda.lblano.text = DatosPeliculas.peliculas[indexPath.row].ano
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    @IBAction func doTapBuscar(_ sender: Any) {
        pelicula = txtPelicula.text!
        
        urlPelicula = "http://www.omdbapi.com/?apikey=cf43d6bc&s=god"
        urlPelicula = "https://www.omdbapi.com/?apikey=fcf43d6bc&s=god"
        
        if pelicula != "" {
            urlPelicula = "http://www.omdbapi.com/?apikey=cf43d6bc&s=\(pelicula)"
            urlPelicula = "https://www.omdbapi.com/?apikey=cf43d6bc&s=\(pelicula)"
        }
        
        
        Alamofire.request(urlPelicula).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                if let respuesta = dictRespuesta.value(forKey: "Response") as? String {
                    self.encontrada = respuesta
                }
                if self.encontrada == "True" {
                    if let buscar = dictRespuesta.value(forKey: "Search") as? NSArray {
                        for i in buscar{
                            if let dictResultado = i as? NSDictionary{
                                var nombrePelicula : String = ""
                                var anoPelicula : String = ""
                                var idPelicula : String = ""
                                
                                if let nombre = dictResultado.value(forKey: "Title") as? String{
                                    nombrePelicula = nombre
                                }
                                if let ano = dictResultado.value(forKey: "Year") as? String{
                                    anoPelicula = ano
                                }
                                if let id = dictResultado.value(forKey: "imdbID") as? String{
                                    idPelicula = id
                                }
                                
                                DatosPeliculas.peliculas.append(Peliculas(nombre: nombrePelicula, id: idPelicula, ano: anoPelicula, duracion: "", rated: "", director: "", genero: ""))
                            }
                        }
                        self.tvPeliculas.reloadData()
                    }
                }
            }
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 0
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                return UITableViewCell()
            
        }
            
    }

