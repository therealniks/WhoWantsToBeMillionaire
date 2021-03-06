//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by N!kS on 03.04.2021.
//

import UIKit

protocol GameSessionDelegate: AnyObject {
    func didEndGame(questionsCount: Int, rightAnswersCount: Int, date: Date)
}

class GameViewController: UIViewController {
    
    @IBOutlet private weak var numberOfQuestionLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var answerButtons : [UIButton]!
    private var questions = [Question]()
    private var question: Question?
    private var countQuestions = 0
    private var rightAnswersCount = Observable<Int>(0)
    private var answers = [String]()
    weak var delegate : GameSessionDelegate?
    private var strategyGame : StrategyGameProtocol!
    
    
    @IBAction private func answerSelect(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {return}
        if answers.contains(buttonText){
            rightAnswersCount.value+=1
            if !questions.isEmpty {
                setupQuestions()
            }else {
                delegate?.didEndGame(
                    questionsCount: countQuestions,
                    rightAnswersCount: rightAnswersCount.value,
                    date: Date())
                self.dismiss(animated: true)
            }
        }else {
            delegate?.didEndGame(
                questionsCount: countQuestions,
                rightAnswersCount: rightAnswersCount.value,
                date: Date())
            self.dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Game.shared.getQuestions()
        countQuestions = questions.count
        checkStrategy()
        setupQuestions()
        startGame()
        updateRightAnswers()
    }
    
    func startGame(){
        let gameSession = GameSession()
        self.delegate = gameSession
        Game.shared.currentGame = gameSession
        
    }
    
    private func setupQuestions() {
        question = questions.removeFirst()
        guard let question = question else {return}
        questionLabel.text = question.question
        let answers = Array(question.answers)
        answerButtons[0].setTitle(answers[0].key, for: .normal)
        answerButtons[1].setTitle(answers[1].key, for: .normal)
        answerButtons[2].setTitle(answers[2].key, for: .normal)
        answerButtons[3].setTitle(answers[3].key, for: .normal)
       
        self.answers = answers
            .filter{$0.value==true}
            .map{$0.key}
    }
    
    private func checkStrategy() {
        let sequencyQuestions = Game.shared.sequencyQuestions
        if !sequencyQuestions {
            strategyGame = StrategyGameConsistent() as StrategyGameProtocol
            questions = strategyGame.getQuestions(questions: questions)
        } else {
            strategyGame = StrategyGameShuffled() as StrategyGameProtocol
            questions = strategyGame.getQuestions(questions: questions)
        }
    }
    private func updateRightAnswers() {
        rightAnswersCount.addObserver(self, options: [.new, .initial]) {
            [weak self] (rightAnswersCount, _) in
            guard let self = self else { return }
            self.numberOfQuestionLabel.text = "???????????? ???\(Int(rightAnswersCount) + 1 ) ???? \(self.countQuestions)"
        }
    }
}
