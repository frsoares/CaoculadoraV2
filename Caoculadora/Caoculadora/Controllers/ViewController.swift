//
//  ViewController.swift
//  Caoculadora
//
//  Created by Francisco Soares Neto on 08/03/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectioView: UICollectionView!
   
    @IBOutlet var anosTextField: UITextField!
    @IBOutlet var mesesTextField: UITextField!
    
    @IBOutlet var inicioView: UIView!
    @IBOutlet var resultadoView: UIView!
    
    @IBOutlet var resultadoLabel: UILabel!
    
    
    let racas: [Raca] = [Raca(descricao: "Bulldog", porte: "Pequeno", imagem: "bulldog"),
                         Raca(descricao: "Catioro", porte: "Médio", imagem: "catioro"),
                         Raca(descricao: "Chihuahua", porte: "Pequeno", imagem: "chihuahua"),
                         Raca(descricao: "Golden", porte: "Grande", imagem: "golden"),
                         Raca(descricao: "Maltês", porte: "Pequeno", imagem: "maltes"),
                         Raca(descricao: "Pastor", porte: "Grande", imagem: "pastor"),
                         Raca(descricao: "Samoieda", porte: "Grande", imagem: "samoieda")
    ]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numberOfItemsInSection")
        return racas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt")
        
        let viewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: "racaViewCell", for: indexPath) as! RacaCollectionViewCell
        let raca = racas[indexPath.row]
        viewCell.imageView.image = UIImage(named: raca.imagem)
        viewCell.labelRaca.text = ""
        viewCell.contentView.backgroundColor = UIColor.white
        let itemSelecionado =  collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        
        if itemSelecionado {
            viewCell.labelRaca.text = racas[indexPath.row].descricao
            viewCell.labelRaca.isHidden = false
        } else {
            viewCell.labelRaca.isHidden = true
        }
        return viewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewCell = collectioView.cellForItem(at: indexPath) as? RacaCollectionViewCell {
            viewCell.labelRaca.text = racas[indexPath.row].descricao
            viewCell.labelRaca.isHidden = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let viewCell = collectioView.cellForItem(at: indexPath) as? RacaCollectionViewCell {
            viewCell.labelRaca.isHidden = true
        }
    }
    
    
    @IBAction func tocou(_ sender: UIButton) {
        let anos = leAnosCaninos()
        let meses = leMesesCaninos()
        
        let cachorro: Cachorro
        
        let selecionado = collectioView.indexPathsForSelectedItems![0]
        let porte = racas[selecionado.row].porte
        
        cachorro = Cachorro(idadeAnos: anos, idadeMeses: meses, porte: porte)
        
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
        self.collectioView.dataSource = self
        self.collectioView.delegate = self
        //deixa primeiro item da collection view já selecionado
        self.collectioView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.left)
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
