//
//  Receita.swift
//  DummyCook
//
//  Created by vitor luiz lima demenighi on 13/11/17.
//  Copyright © 2017 Aline Ebone. All rights reserved.
//

import UIKit

class Receita: NSObject {

    var nome: String = ""
    var listaPassos = [CDPasso]()
    var listaIngredientes = [Ingredientes]()
    var textoIngredientes: String = ""
    
}
