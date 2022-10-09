//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var titleAnswerLabel: UILabel!
    @IBOutlet weak var subtitleAnswerLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        titleAnswerLabel.text = "Вы - \(getCommonAnswer().rawValue)"
        subtitleAnswerLabel.text = String(getCommonAnswer().definition)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    private func getCommonAnswer() -> Animal {
        var countedAnswersOfAnimal: [Animal: Int] = [:]
        var quantitycommonAnswer: Int
        let defaultAnswer = answers.first!.animal
        
        for animal in answers {
            countedAnswersOfAnimal[animal.animal, default: 0] += 1
        }
        
        guard let commonAnswer = countedAnswersOfAnimal.max(by: { a, b in a.value < b.value }) else {
            return defaultAnswer
        }
        
        quantitycommonAnswer = countedAnswersOfAnimal.values.filter { $0 == commonAnswer.value }.count
        
        if commonAnswer.value == 1 || quantitycommonAnswer > 1 {
            return defaultAnswer
        }
        return commonAnswer.key
    }
    
}
