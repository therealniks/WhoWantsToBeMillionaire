//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by N!kS on 03.04.2021.
//

import UIKit

protocol GameSessionDelegate: AnyObject {
    func didEndGame(questionsCount: Int,rightAnswersCount : Int,date: Date)
}

class GameViewController: UIViewController {

    @IBOutlet private weak var numberOfQuestionLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var answerButtons : [UIButton]!
    @IBAction private func answerSelect(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        guard let buttonText = button.titleLabel?.text else {return}
        if answers.contains(buttonText){
            rightAnswersCount+=1
            if !questions.questions.isEmpty{
                setupQuestions()
            }else{
                delegate?.didEndGame(
                    questionsCount: countQuestions ?? 0,
                    rightAnswersCount: rightAnswersCount,
                    date: Date())
                self.dismiss(animated: true)
            }
        }else{
            delegate?.didEndGame(
                questionsCount: countQuestions ?? 0,
                rightAnswersCount: rightAnswersCount,
                date: Date())
            let record = GameSession(questionsCount: countQuestions ?? 0, rightAnswersCount: rightAnswersCount,date: Date())
            Game.shared.addRecord(record)
            self.dismiss(animated: true)
            
        }
    }
    private var questions = Questions()
    private var question : Question?
    private var countQuestions: Int?
    private var rightAnswersCount = 0
    private var answers = [String]()
    weak var delegate : GameSessionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        countQuestions = questions.questions.count
        setupQuestions()
    }
    

    private func setupQuestions(){
        question = questions.questions.removeFirst()
        guard let question = question else {return}
        questionLabel.text = question.question
        numberOfQuestionLabel.text = String(question.id+1)
        let answers = Array(question.answers)
        answerButtons[0].setTitle(answers[0].key, for: .normal)
        answerButtons[1].setTitle(answers[1].key, for: .normal)
        answerButtons[2].setTitle(answers[2].key, for: .normal)
        answerButtons[3].setTitle(answers[3].key, for: .normal)
        
        self.answers = answers
            .filter{$0.value==true}
            .map{$0.key}
    }

}
