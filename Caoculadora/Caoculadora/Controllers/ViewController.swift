//
//  ViewController.swift
//  Caoculadora
//
//  Created by Francisco Soares Neto on 08/03/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Pequeno"
        } else if row == 1 {
            return "Médio"
        } else {
            return "Grande"
        }
    }
    

    @IBOutlet var anosTextField: UITextField!
    @IBOutlet var mesesTextField: UITextField!
    
    @IBOutlet var inicioView: UIView!
    @IBOutlet var resultadoView: UIView!
    
    @IBOutlet var resultadoLabel: UILabel!
    
    @IBOutlet var sizePicker: UIPickerView!
    
  
    @IBAction func tocou(_ sender: UIButton) {
        let anos = leAnosCaninos()
        let meses = leMesesCaninos()
        
        let cachorro: Cachorro
        
        let selecionado = sizePicker.selectedRow(inComponent: 0)
        
        if selecionado == 0 {
            cachorro = Cachorro(idadeAnos: anos, idadeMeses: meses, porte: "pequeno")
            
        } else if selecionado == 1 {
            cachorro = Cachorro(idadeAnos: anos, idadeMeses: meses, porte: "medio")
        }
        else {
            cachorro = Cachorro(idadeAnos: anos, idadeMeses: meses, porte: "grande")
        }
        
        exibeResultado(de: cachorro.idadeHumana())
    }
    
    @IBAction func recaocular() {
        //Esconde view do resultado e exibe view de início
        resultadoView.isHidden = true
        inicioView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sizePicker.dataSource = self
        self.sizePicker.delegate = self
    }

    func leAnosCaninos() -> Int {
        // Lê o que está escrito no text field de anos
        let anosCaninos: String = anosTextField.text!
        
        // Transformar texto em Int
        let anosCaninosInt: Int
        anosCaninosInt = Int(anosCaninos)!
        
        return anosCaninosInt
    }
    
    func leMesesCaninos() -> Int {
        // Lê o que está escrito no text field de meses
        let mesesCaninos: String = mesesTextField.text!
        
        // Transformar texto em Int
        let mesesCaninosInt: Int
        mesesCaninosInt = Int(mesesCaninos)!
        
        return mesesCaninosInt
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
