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
    var mostPopularAnimal: AnimalType?


    override func viewDidLoad() {
        super.viewDidLoad()

        determinationResultOf(answersChoosen)
        resultLabel.text = "Вы \(mostPopularAnimal!.rawValue)"
        descriptionOfResultLabel.text = mostPopularAnimal?.definition
    }

    deinit {
        print("ResultsViewController has been dealocated")
    }


}


extension ResultsViewController {

    func determinationResultOf(_ answerChoosen: [Answer]) {

        var choices: [AnimalType: Int] = [:]

        for animal in answersChoosen {
            if let animalType = choices[animal.type] {
                choices.updateValue(animalType + 1, forKey: animal.type)
            } else {
                choices[animal.type] = 1
            }

        }


        let sortedChoices = choices.sorted{ $0.value > $1.value }
        mostPopularAnimal = sortedChoices.first?.key

    }
}
