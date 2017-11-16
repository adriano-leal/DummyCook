//
//  DetailsViewController.swift
//  DummyCook
//
//  Created by Aline Ebone on 10/11/17.
//  Copyright © 2017 Aline Ebone. All rights reserved.
//

import UIKit
import CoreData


class DetailsViewController: UIViewController {
    
    @IBOutlet var recipeTitle: UILabel!
    @IBOutlet var imagemReceita: UIImageView!
    @IBOutlet weak var textRequirements: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var textIngredientes: UITextView!
    @IBOutlet weak var stepsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        imagemReceita.image = UIImage(named: data.imagemReceita!)
        imagemReceita.layer.cornerRadius = 10
        imagemReceita.layer.masksToBounds = true
        recipeTitle.text = data.nome
        textRequirements.text = data.textoRequirements
        textIngredientes.text = (data.textoIngredientes as! [String]).joined(separator: "\n")
       // startButton.layer.cornerRadius = 10
        //startButton.layer.masksToBounds = true
        //stepsButton.layer.cornerRadius = 10
        //stepsButton.layer.masksToBounds = true
    
    }
    
    var data: CDReceita! {
        didSet {
            //imagemReceita.layer.cornerRadius = 20
          
            
            //let passos = data.relationship!.allObjects as! [CDPasso]
            //imagemReceita.image = UIImage(named: data.imagemReceita!)
            
            
            //textoIngredientes.text = data.textoIngredientes
            //time.text = data.time
            //recipeTitle.text = data.nome
            //cost.text = data.cost
            //recipeImage.image = data.recipeImage
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if( segue.identifier == "segueToSteps" ) {
            let destinoIniciaReceita = segue.destination as! StepsViewController
            let passos = data.relationship!.allObjects as! [CDPasso]
            destinoIniciaReceita.listaDePassos2 = passos.sorted(by: { (passoA, passoB) -> Bool in
                return passoA.indice < passoB.indice
            })
            destinoIniciaReceita.index = 0
        }
        if(segue.identifier == "segueToStepsList"){
            let dest = segue.destination as! StepsListViewController
            let passos = data.relationship!.allObjects as! [CDPasso]
            dest.listaDePassos = passos.sorted(by: { (passoA, passoB) -> Bool in
                return passoA.indice < passoB.indice
            })
        }
        
    }
    

    @IBAction func goToSteps(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToSteps", sender: self)
    }
    
    
    @IBAction func goToStepsList(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToStepsList", sender: self)
    }
}
