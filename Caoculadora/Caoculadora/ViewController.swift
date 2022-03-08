//
//  ViewController.swift
//  Caoculadora
//
//  Created by Francisco Soares Neto on 08/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tocouMedio() {
        print("Hello World")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func transformaAnosCaninosEmHumanos() {
        // Lê o que está escrito no text field de anos
        // Multiplica o valor escrito em anos por 7
    }
    
    func transformaMesesCaninosEmHumanos() {
        // Lê o que está escrito no text field de meses
        // Multiplica o valor escrito em meses por 7 / 12
    }
    
    func somaAnosTransformados() {
        // soma anos humanos + meses humanos
    }
    
    func escondeComponentes() {
        // Esconde os labels, botões e text fields relativos a anos, meses e porte
    }
    
    func exibeResultado() {
        // Escreve na label de resultados o valor calculado em anos
        // Exibe os labels de resultado e o botão de recãocular
    }

}
