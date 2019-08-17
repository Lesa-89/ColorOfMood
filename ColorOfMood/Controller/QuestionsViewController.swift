//
//  QuestionsViewController.swift
//  ColorOfMood
//
//  Created by Maksim Grebenozhko on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestions().shuffled()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - IB Actions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
}

extension QuestionsViewController {
    
    // MARK: - Private Methods
    
    // Update user interface
    private func updateUI() {
        
        if !singleStackView.isHidden {
            for button in singleButtons {
                button.setTitle("", for: .normal)
            }
        }
        
        // Hide everething
        for stackView in [singleStackView, multipleStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question label
        questionLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for question progress view
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentAnswers = currentQuestion.answers.shuffled()
        
        // Show stack view corresponding to question type
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        }
    }
    
    // MARK: - Navigation
    // Show next question or go to the next screen
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {

            // { Убрать после привязки к финальному вью
            questionIndex = 0
            updateUI()
            // Убрать после привязки к финальному вью }

            //performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
    }
    
    private func updateSingleStackView(using answers: [Answer]) {
        // Show single stack view
        singleStackView.isHidden = false

        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func updateMultipleStackView(using answers: [Answer]) {
        // Show multiple stack view
        multipleStackView.isHidden = false

        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func updateRangedStackView(using answers: [Answer]) {
        // Show multiple stack view
//        rangedStackView.isHidden = false
//
//        rangedLabels.first?.text = answers.first?.text
//        rangedLabels.last?.text = answers.last?.text
    }
}
