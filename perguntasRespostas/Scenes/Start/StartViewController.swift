//
//  StartViewController.swift
//  perguntasRespostas
//
//  Created by Leonardo Cunha on 19/09/21.
//  Copyright © 2021 Leonardo Cunha. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARKS : - Outlets / Actions

    @IBOutlet weak var viewOutlet: UIView!
    

   
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var botaoDeOutlet: UIButton!
    @IBAction func botaoDeStart(_ sender: UIButton) {

        let novaViewController = QuestionsViewController()
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
            
            textLabel.text = "Responda 10 perguntas e veja sua pontuação no fim!"
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
            scoreLabel.text = "\(nota.shared.scoreAtual)/10 Acertos"
            nota.shared.scoreAtual = 0
            botaoDeOutlet.layer.cornerRadius = 18
            botaoDeOutlet.backgroundColor = .clear
            botaoDeOutlet.setTitleColor(UIColor(red: 98.0/255.0, green: 115.0/255.0, blue: 255.0/255.0, alpha: 1), for: UIControl.State.normal)

        }
    }
}
