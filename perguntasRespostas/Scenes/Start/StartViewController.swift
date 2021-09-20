//
//  StartViewController.swift
//  perguntasRespostas
//
//  Created by Leonardo Cunha on 19/09/21.
//  Copyright © 2021 Leonardo Cunha. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARKS: - Atributes & Variables
    
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
     
    
    // MARKS : - Outlets / Actions

    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var botaoDeOutlet: UIButton!
    
    @IBAction func botaoDeStart(_ sender: UIButton) {
        let novaViewController = QuestionsViewController(arrayQuestions: arrayQuestions)
        navigationController?.pushViewController(novaViewController, animated: true)
    }

    // MARKS : - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Perguntas e respostas"
        navigationController?.navigationBar.barTintColor = UIColor(red: 98.0/255.0, green: 115.0/255.0, blue: 255.0/255.0, alpha: 1)
        navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        viewOutlet.layer.cornerRadius = 15
        

    }
    override func viewWillAppear(_ animated: Bool) {
        
        if nota.shared.showStartScreen {
            
            textLabel.text = "Responda \(arrayQuestions.count) perguntas e veja sua pontuação no fim!"
            botaoDeOutlet.setTitle("Start!", for: UIControl.State.normal)
            scoreLabel.isHidden = true
            nota.shared.scoreAtual = 0
            botaoDeOutlet.layer.cornerRadius = 18
            botaoDeOutlet.backgroundColor = UIColor(red: 98.0/255.0, green: 115.0/255.0, blue: 255.0/255.0, alpha: 1)
            botaoDeOutlet.setTitleColor(.white, for: UIControl.State.normal)
            
        }else {
            textLabel.text = "Sua pontuação foi de:"
            scoreLabel.isHidden = false
            navigationItem.hidesBackButton = true
            botaoDeOutlet.setTitle("Tentar novamente", for: UIControl.State.normal)
            scoreLabel.text = "\(nota.shared.scoreAtual)/\(arrayQuestions.count) Acertos"
            nota.shared.scoreAtual = 0
            botaoDeOutlet.layer.cornerRadius = 18
            botaoDeOutlet.backgroundColor = .clear
            botaoDeOutlet.setTitleColor(UIColor(red: 98.0/255.0, green: 115.0/255.0, blue: 255.0/255.0, alpha: 1), for: UIControl.State.normal)

        }
    }
}
