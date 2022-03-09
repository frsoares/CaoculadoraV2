//
//  Cachorro.swift
//  Caoculadora
//
//  Created by Alessandra Pereira on 09/03/22.
//

import Foundation

class Cachorro {
    let idadeAnos: Int
    let idadeMeses: Int
    let porte: String
    
    init(idadeAnos: Int, idadeMeses: Int, porte: String){
        self.idadeAnos = idadeAnos
        self.idadeMeses = idadeMeses
        self.porte = porte
    }
    
    func anosHumanos() -> Int {
        // Multiplica o valor escrito em anos por 7
        return idadeAnos * 7
    }
    
    func mesesHumanos() -> Int {
        // Multiplica o valor escrito em meses por 7 / 12
        return idadeMeses * 7 / 12
    }
    
    func idadeHumana() -> Int {
        var idadeHumana: Int
        idadeHumana = anosHumanos() + mesesHumanos()
        
        if porte == "Pequeno" {
            idadeHumana = idadeHumana - 7
        } else if porte == "Grande" {
            idadeHumana = idadeHumana + 5
        }
        
        return idadeHumana
    }
}
