//
//  MainViewController.swift
//  WhoWantsToBe
//
//  Created by N!kS on 03.04.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var startGameButton: UIButton!
    @IBOutlet private weak var showResultsButton: UIButton!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var shuffleGameButton: UIButton!
    private var isShowSetting: Bool = false
    private let questionCaretaker = QuestionCaretaker()
    
    @IBAction private func showSettings(_ sender: Any) {
        if isShowSetting {
            UIView.animate(withDuration: 0.3) {
                self.mainView.transform = .identity
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                let transition = CGAffineTransform(translationX: -70, y: -70)
                self.mainView.transform = transition
            }
        }
        isShowSetting.toggle()
    }
    
    @IBAction private func addQuestion() {
        showAlertAddQuestion()
        UIView.animate(withDuration: 0.3) {
            self.mainView.transform = .identity
        }
        isShowSetting.toggle()
    }
    
    @IBAction private func shuffleGame(_ sender: Any) {
        if !Game.shared.sequencyQuestions {
            shuffleGameButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        } else {
            shuffleGameButton.setImage(UIImage(systemName: "shuffle"), for: .normal)
        }
        Game.shared.sequencyQuestions.toggle()
    }
    
    
    private func showAlertAddQuestion() {
        let alert = UIAlertController(title: "Добавить вопрос",
                                      message: "Напишите ваш вопрос и ответы к вопросу. \nВсе поля должны быть уникальны.",
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Вопрос"
        }
        alert.addTextField { textField in
            textField.placeholder = "Правильный ответ"
        }
        alert.addTextField { textField in
            textField.placeholder = "Ответ"
        }
        alert.addTextField { textField in
            textField.placeholder = "Ответ"
        }
        alert.addTextField { textField in
            textField.placeholder = "Ответ"
        }
        
        let add = UIAlertAction(title: "Добавить",
                                style: .default) { _ in
            let question = Question(question: alert.textFields?[0].text ?? "",
                                    answers: [
                                        "\(alert.textFields?[1].text ?? "")" : true,
                                        "\(alert.textFields?[2].text ?? "")" : false,
                                        "\(alert.textFields?[3].text ?? "")" : false,
                                        "\(alert.textFields?[4].text ?? "")" : false
                                    ])
            try? self.questionCaretaker.saveQuestion(question)
        }
        add.isEnabled = false
        let cancel = UIAlertAction(title: "Отмена",
                                   style: .cancel)
        alert.addAction(cancel)
        alert.addAction(add)
        checkQuestionFields(alert: alert, add: add)
        self.present(alert, animated: true)
    }
    
    private func checkQuestionFields(alert: UIAlertController, add: UIAlertAction) {
        for i in 0...4 {
            NotificationCenter.default.addObserver(
                forName: UITextField.textDidChangeNotification,
                object: alert.textFields?[i],
                queue: OperationQueue.main
            ) { notification -> Void in
                let textFields = alert.textFields?.compactMap{ $0.text }
                guard
                    let texts = textFields
                else {
                    add.isEnabled = true
                    return
                }
                if Set(texts).count == 5, !texts.contains("") {
                    add.isEnabled = true
                } else {
                    add.isEnabled = false
                }
            }
        }
    }
}
