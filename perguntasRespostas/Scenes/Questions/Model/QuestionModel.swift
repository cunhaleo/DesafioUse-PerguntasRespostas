//
//  QuestionModel.swift
//  perguntasRespostas
//
//  Created by Leonardo Cunha on 18/09/21.
//  Copyright © 2021 Leonardo Cunha. All rights reserved.
//

import Foundation

struct QuestionModel {
    
    let question: String
    let respostas: [String]
    let respostaCorreta: Int
    
}
class nota {
 
    var scoreAtual: Int = 0
    var showStartScreen: Bool = true
    
static var shared = nota()
    
}


