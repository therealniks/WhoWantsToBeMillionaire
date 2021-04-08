//
//  RecordsViewController.swift
//  WhoWantsToBe
//
//  Created by N!kS on 05.04.2021.
//

import UIKit

class RecordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension RecordsViewController:UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Game.shared.results.count
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as? ResultsCell else { preconditionFailure("ResultsCell Error!") }
            let record = Game.shared.results[indexPath.row]
            let numberOfQuestions = Double(record.questionsCount)
            let rightAnswers = Double(record.rightAnswersCount)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            cell.dateLabel.text = "Дата:\n"+dateFormatter.string(from: record.date)
            cell.percentLabel.text = "% ответов:\n\(String(rightAnswers/numberOfQuestions))"
            cell.recordLabel.text =  "Верных ответов:\n\(record.rightAnswersCount)"
            return cell
        }
}
