//
//  ViewController.swift
//  SearchMovie
//
//  Created by Alumno on 24/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var txtbuscar: UITextField!
    @IBOutlet weak var lbltitulo: UILabel!
    @IBOutlet weak var lblano: UILabel!
    @IBOutlet weak var lblrated: UILabel!
    @IBOutlet weak var lblduracion: UILabel!
    @IBOutlet weak var lblgenero: UILabel!
    @IBOutlet weak var lbldirector: UILabel!
    @IBOutlet weak var lblencuentra: UILabel!
    @IBOutlet weak var aicargar: UIActivityIndicatorView!
    
    var urlMovie = "https://www.omdbapi.com/?apikey=cf43d6bc&t=ii"
    var Pelicula : String = ""
    var encontrada : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doTapBuscar(_ sender: Any) {
        aicargar.startAnimating()
        
        Alamofire.request(urlMovie).responseJSON {response in
            
            self.lbltitulo.text = ""
            self.lblano.text = ""
            self.lblrated.text = ""
            self.lblano.text = ""
            self.lblano.text = ""
            self.lblano.text = ""
            
            
            
            if let dictRespuesta = response.result.value as? NSDictionary{
                if let nombre = dictRespuesta.value(forKey: "Title") as? String{
                    self.lbltitulo.text = nombre
                }
                
                if let ano = dictRespuesta.value(forKey: "Year") as? String{
                    self.lblano.text = ano
                }
                
                if let Rated = dictRespuesta.value(forKey: "Rated") as? String{
                    self.lblrated.text = Rated
                }
                
                if let Duracion = dictRespuesta.value(forKey: "Runtime") as? String{
                    self.lblduracion.text = Duracion
                }
                
                if let Genero = dictRespuesta.value(forKey: "Genre") as? String{
                    self.lblgenero.text = Genero
                }
                
                if let Director = dictRespuesta.value(forKey: "Director") as? String{
                    self.lbldirector.text = Director
                }
                
            }
        }
        
    }
    
}

