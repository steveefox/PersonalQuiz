//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionOfResultLabel: UILabel!
    
    
     var answersChoosen: [Answer] = []
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultAnimal = determinationResultOf(answersChoosen)
        resultLabel.text = "Вы \(resultAnimal.rawValue)"
        descriptionOfResultLabel.text = resultAnimal.definition
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
    

}


extension ResultsViewController {
    
    func determinationResultOf(_ answerChoosen: [Answer]) -> AnimalType {
        var resultAnimal: AnimalType = .dog
        
        var choices: [AnimalType: Int] = [
            .dog : 0,
            .cat : 0,
            .turtle: 0,
            .rabbit: 0
        ]
        
        for answer in answersChoosen {
            switch answer.type {
            case .dog: choices.updateValue(+1, forKey: .dog)
            case .cat: choices.updateValue(+1, forKey: .cat)
            case .turtle: choices.updateValue(+1, forKey: .turtle)
            case .rabbit: choices.updateValue(+1, forKey: .rabbit)
            }
        }
        
        for choice in choices {
            var maxChoices = choice
            if choice.value > maxChoices.value {
                maxChoices = choice
            }
            resultAnimal = maxChoices.key
        }
        
        return resultAnimal
        
    }
}
