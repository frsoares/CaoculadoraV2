//
//  ViewController.swift
//  Caoculadora
//
//  Created by Francisco Soares Neto on 08/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var anosTextField: UITextField!
    @IBOutlet var mesesTextField: UITextField!
    
    @IBOutlet var inicioView: UIView!
    @IBOutlet var resultadoView: UIView!
    
    @IBOutlet var resultadoLabel: UILabel!
    
    @IBOutlet var pequenoButton: UIButton!
    @IBOutlet var medioButton: UIButton!
    @IBOutlet var grandeButton: UIButton!
  
    @IBAction func tocou(_ sender: UIButton) {
        if sender == pequenoButton {
            exibeResultado(de: somaAnosTransformados())
        } else if sender == medioButton {
            exibeResultado(de: somaAnosTransformados() + 3)
        }
        else {
            exibeResultado(de: somaAnosTransformados() + 7)
        }
    }
    
    @IBAction func recaocular() {
        //Esconde view do resultado e exibe view de início
        resultadoView.isHidden = true
        inicioView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func transformaAnosCaninosEmHumanos() -> Int {
        // Lê o que está escrito no text field de anos
        let anosCaninos: String = anosTextField.text!
        
        // Transformar texto em Int
        let anosCaninosInt: Int
        anosCaninosInt = Int(anosCaninos)!
        
        // Multiplica o valor escrito em anos por 7
        let anosHumanosInt = anosCaninosInt * 7
        
        return anosHumanosInt
    }
    
    func transformaMesesCaninosEmHumanos() -> Int {
        // Lê o que está escrito no text field de meses
        let mesesCaninos: String = mesesTextField.text!
        
        // Transformar texto em Int
        let mesesCaninosInt: Int
        mesesCaninosInt = Int(mesesCaninos)!
        
        // Multiplica o valor escrito em meses por 7 / 12
        let mesesHumanosInt = mesesCaninosInt * 7 / 12
        
        return mesesHumanosInt
    }
    
    func somaAnosTransformados() -> Int {
        // soma anos humanos + meses humanos
        let anos = transformaAnosCaninosEmHumanos()
        let meses = transformaMesesCaninosEmHumanos()
        
        return anos + meses
    }
    
    func escondeComponentes() {
        // Esconde os labels, botões e text fields relativos a anos, meses e porte
        inicioView.isHidden = true
    }
    
    func exibeResultado(de valor: Int) {
        // Escreve na label de resultados o valor calculado em anos
        resultadoLabel.text = "\(valor) anos!"
        
        //esconde tela de início
        escondeComponentes()
        
        // Exibe os labels de resultado e o botão de recãocular
        resultadoView.isHidden = false
        
    }

}

class Cachorro {
    var idadeAnos: Int
    var idadeMeses: Int
    var porte: String
    
    init(idadeAnos: Int, idadeMeses: Int, porte: String){
        self.idadeAnos = idadeAnos
        self.idadeMeses = idadeMeses
        self.porte = porte
    }
}
