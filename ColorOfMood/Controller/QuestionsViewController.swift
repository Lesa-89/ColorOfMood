//
//  QuestionsViewController.swift
//  ColorOfMood
//
//  Created by Maksim Grebenozhko on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var bacgroundImage: UIImageView!
    @IBOutlet var questionLabel: UILabel!

    @IBOutlet var questionProgressView: UIProgressView!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var applyButton: UIButton!
    
    private let questions = Question.getQuestions().shuffled()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private let cornerRadius: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
        configureLabels()
        updateUI()
    }
    
    // MARK: - IB Actions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }

        let currentAnswers = questions[questionIndex].answers
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
    
    // MARK: Configure elements
    
    private func configureButtons() {
        
        applyButton.layer.cornerRadius = cornerRadius
        
        for button in singleButtons {
            button.layer.cornerRadius = cornerRadius
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.textAlignment = .center
        }
    }
    
    private func configureLabels() {
        
        questionLabel.layer.masksToBounds = true
        questionLabel.layer.cornerRadius = cornerRadius
        
        for label in multipleLabels {
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            label.textAlignment = .center
        }
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
            performSegue(withIdentifier: "resultView", sender: nil)
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
        for switches in multipleSwitches {
            switches.isOn = false
        }
    }
    
    private func prepareColor() -> ColorType {
        
        var frequencyOfColors: [ColorType: Int] = [:]
        let colors = answersChoosen.map { $0.type }
        
        for color in colors {
            frequencyOfColors[color] = (frequencyOfColors[color] ?? 0) + 1
        }
        
        let sortedFrequencyOfColors = frequencyOfColors.sorted { $0.value > $1.value }
        guard let mostFrequensyColor = sortedFrequencyOfColors.first?.key else { return .blue }
        
        switch mostFrequensyColor {
        case .green: return .green
        case .yellow: return .yellow
        case .blue: return .blue
        case .purple: return .purple
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultView" else { return }
        
        let resultVC = segue.destination as! ResultController
        resultVC.viewColor = prepareColor()
    }
    
}
