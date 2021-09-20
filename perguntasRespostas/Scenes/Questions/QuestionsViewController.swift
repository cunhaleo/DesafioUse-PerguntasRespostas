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
    QuestionModel (question: "1. Qual o nome do presidente do Brasil que ficou conhecido como Jango?", respostas: ["Jânio Quadros", "Jacinto Anjos", "Getúlio Vargas", "João Goulart"], respostaCorreta: 3),
    QuestionModel (question:"2. Quais os países que têm a maior e a menor expectativa de vida do mundo?", respostas: ["Japão e Serra Leoa", "Austrália e Afeganistão", "Brasil e Congo", "Estados Unidos e Angola"], respostaCorreta: 0),
    QuestionModel (question: "3. Quanto tempo a luz do Sol demora para chegar à Terra?", respostas: ["12 minutos", "1 dia", "14 horas", "8 minutos"], respostaCorreta: 3),
    QuestionModel (question: "4. Qual das alternativas menciona apenas símbolos nacionais?", respostas: ["Bandeira insígnia da presidência, bandeira nacional, brasão, hinos e selo", "Bandeira nacional, armas nacionais, hino nacional e selo nacional", "Bandeira nacional, brasão, hino nacional, hino da independência, armas nacionais, cores nacionais, insígnia da presidência, fauna e flora nacional, seleção brasileira de futebol e o pelourinho", "Bandeira insígnia da presidência, brasão flora e fauna e hinos"], respostaCorreta: 1),
    QuestionModel (question: "5. Qual o maior animal terrestre?", respostas:["Baleia Azul", "Dinossauro", "Elefante Africano", "Tubarão Branco", "Girafa"], respostaCorreta: 2),
    QuestionModel (question: "6. Qual a religião monoteísta que conta com o maior número de adeptos no mundo?", respostas:["Islamismo", "Cristianismo", "Judaísmo", "Hinduísmo"], respostaCorreta: 1),
    QuestionModel (question: "7. Qual o nome do cientista que descobriu o processo de pasteurização e a vacina contra a raiva?", respostas:["Marie Curie", "Blaise Pascal", "Louis Pasteur", "Antoine Lavoisier"], respostaCorreta: 2),
    QuestionModel (question: "8. Quantos graus são necessários para que dois ângulos sejam complementares?", respostas:["45", "90", "180", "360"], respostaCorreta: 1),
    QuestionModel (question: "9. Qual o metal cujo símbolo químico é o Au?", respostas:["Cobre", "Prata", "Mercúrio", "Ouro"], respostaCorreta: 3),
    QuestionModel (question: "10. Qual desses filmes foi baseado na obra de Shakespeare?", respostas:["Muito Barulho por Nada (2012)", "Capitães de Areia (2011)", "A Dama das Camélias (1936)", "A Revolução dos Bichos (1954)"], respostaCorreta: 0),
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
                nota.shared.showStartScreen = true
                buttonOutlet.setTitle("Próxima pergunta", for: UIControl.State.normal)
            
                if questaoAtual == arrayQuestions.count - 1 { // Se for a última pergunta, configurar botão para ver resultados
                
                    buttonOutlet.setTitle("Ver Resultado", for: UIControl.State.normal)
            
                }
        
            }
            else if buttonOutlet.currentTitle?.description == "Próxima pergunta"{
            
                questaoAtual += 1
                
                setupUI()
            
            }
            else if buttonOutlet.currentTitle?.description == "Ver Resultado" {// Mostrar tela resultados
                questaoAtual = 0
                nota.shared.showStartScreen = false
                let viewController = StartViewController()
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
        buttonOutlet.layer.cornerRadius = 18
        
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
        guard let indexSelected = indexSelected else {return print("nao passou pelo index selected")}
        
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
