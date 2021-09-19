//
//  QuestionsViewController.swift
//  perguntasRespostas
//
//  Created by Leonardo Cunha on 18/09/21.
//  Copyright © 2021 Leonardo Cunha. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARKS : - Attributes & Variables
    
    let arrayQuestions: [QuestionModel] = [
    QuestionModel (question: "Pergunta numero um", respostas: ["Alternativa zero", "Alternativa um", "Alternativa dois", "Alternativa tres"], respostaCorreta: 1),
    QuestionModel (question: "Pergunta numero dois", respostas: ["Alternativa zero", "Alternativa um", "Alternativa dois", "Alternativa tres", "alternativa 4"], respostaCorreta: 0),
    QuestionModel (question: "Pergunta numero tres", respostas: ["Alternativa zero", "Alternativa um", "Alternativa dois", "Alternativa tres"], respostaCorreta: 3)
    ]
    
    var questaoAtual: Int = 0
    var indexSelected: IndexPath?
    var score: Int = 0
    var activeButton: Bool = false
    
    // MARKS: - Outlets & Actions
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    
    @IBAction func buttonResponder(_ sender: Any) {
        
        // Quando botao "Responder"-> Compara as respostas para verificar se está incorreta / troca o style das cells (correct/incorrect) / troca o botao para "Próxima pergunta"
        // Quando botao "Próxima pergunta" -> aumenta contador de questaoAtual e da um reload na tela. / Atualiza botao para "Responder"
        // Após responder última pergunta -> mostra botão Ver resultados
        // Botão ver resultados -> mostra a tela resultados
        if activeButton {
            
            if buttonOutlet.currentTitle?.description == "Responder" {
            
                checkAnswers()
            
                buttonOutlet.setTitle("Próxima pergunta", for: UIControl.State.normal)
            
                if questaoAtual == arrayQuestions.count - 1 { // Se for a última pergunta, configurar botão para ver resultados
                
                    buttonOutlet.setTitle("Ver Resultado", for: UIControl.State.normal)
            
                }
        
            }
            else if buttonOutlet.currentTitle?.description == "Próxima pergunta"{
            
                questaoAtual += 1
                
                setupUI()
            
            }
            else if buttonOutlet.currentTitle?.description == "Ver Resultado" {// MOSTRAR A TELA DE RESULTADO
                questaoAtual = 0
                let viewController = InicioViewController()
                navigationController?.pushViewController(viewController, animated: true)
                }
        }else{//Botão desativado
        }
    }
    // MARKS:  - Overrides
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nota.shared.scoreAtual = 0
        questaoAtual = 0
        self.tableView.delegate = self
        setupUI()

    }
    
    // MARKS : - Methods
    
    func setupUI() {
        
        buttonOutlet.setTitle("Responder", for: UIControl.State.normal)
        buttonOutlet.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        activeButton = false
        questionLabel.text = arrayQuestions[questaoAtual].question
        tableView.register(UINib(nibName: "RespostasCell", bundle: nil), forCellReuseIdentifier: "RespostasCell")
        tableView.dataSource = self
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayQuestions[questaoAtual].respostas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RespostasCell") as? RespostasCell {

            
            cell.setup(title: "\(arrayQuestions[questaoAtual].respostas[indexPath.row])", style: .blank)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexSelected = indexPath
        activeButton = true
        buttonOutlet.backgroundColor = UIColor(red: 98/255, green: 115/255, blue: 255, alpha: 1)

    }
    func checkAnswers() {
        guard let indexSelected = indexSelected else {return print("Caiu no return")}
        
        let indexPathCorrect = IndexPath(row: arrayQuestions[questaoAtual].respostaCorreta, section: 0)
                
        if let cellCorrect = tableView.cellForRow(at: indexPathCorrect) as? RespostasCell {
                     cellCorrect.setStyle(.correct)
        }
       
        if let cellSelected = tableView.cellForRow(at: indexSelected) as? RespostasCell,
            indexSelected.row != arrayQuestions[questaoAtual].respostaCorreta {
            cellSelected.setStyle(.incorrect)
        }
        if indexSelected.row == arrayQuestions[questaoAtual].respostaCorreta {
            nota.shared.scoreAtual += 1
            
            
        }
        
        }
    
    
            
         
        
         
        
    
}
