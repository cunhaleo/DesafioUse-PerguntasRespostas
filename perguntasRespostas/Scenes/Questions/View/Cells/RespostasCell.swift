//
//  RespostasCell.swift
//  perguntasRespostas
//
//  Created by Leonardo Cunha on 18/09/21.
//  Copyright © 2021 Leonardo Cunha. All rights reserved.
//

import UIKit

class RespostasCell: UITableViewCell {

    enum Style {
        case blank
        case selected
        case correct
        case incorrect
        
    }
    var cellStyle: Style = .blank
    
    // MARKS: - Outlet & Actions
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    
    @IBOutlet weak var correctMark: UIImageView!
    
    @IBOutlet weak var incorrectMark: UIImageView!
    
    
    // MARKS: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    
        if viewBackground.backgroundColor != UIColor.green.withAlphaComponent(0.1) && viewBackground.backgroundColor != UIColor.red.withAlphaComponent(0.1){
            
            cellStyle = selected ? .selected : .blank
            setStyle(cellStyle)
        }
    }
    
    // MARKS: - Methods
    
    
    
    func setup (title: String, style: Style) {
        
        
        cellLabel.text = title
        viewBackground.layer.cornerRadius = 20
        viewBackground.layer.borderWidth = 1
        setStyle(style)
    }
    
    func setStyle(_ style: Style) {
        switch style {
        case .blank:
            viewBackground.backgroundColor = .white
            viewBackground.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
            cellLabel.textColor = .black
            incorrectMark.isHidden = true
            correctMark.isHidden = true

            
        case .selected:
            viewBackground.backgroundColor = UIColor(red: 98/255, green: 115/255, blue: 255, alpha: 0.1)
            viewBackground.layer.borderColor = UIColor(red: 98/255, green: 115/255, blue: 255, alpha: 1).cgColor
            cellLabel.textColor = UIColor(red: 98/255, green: 115/255, blue: 255, alpha: 1)
            incorrectMark.isHidden = true
            correctMark.isHidden = true
            
        case .correct:
            viewBackground.backgroundColor = UIColor.green.withAlphaComponent(0.1)
            viewBackground.layer.borderColor = UIColor.green.withAlphaComponent(0.8).cgColor
            cellLabel.textColor = UIColor(red: 56/255, green: 197/255, blue: 61/195, alpha: 1)
            incorrectMark.isHidden = true
            correctMark.isHidden = false
            
        case .incorrect:
            viewBackground.backgroundColor = UIColor.red.withAlphaComponent(0.1)
            viewBackground.layer.borderColor = UIColor.red.withAlphaComponent(0.8).cgColor
            cellLabel.textColor = UIColor(red: 255/255, green: 90/255, blue: 90/255, alpha: 1)
            incorrectMark.isHidden = false
            correctMark.isHidden = true
            
        }
        
    }
}
