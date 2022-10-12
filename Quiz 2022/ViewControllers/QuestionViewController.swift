//
//  QuestionViewController.swift
//  Quiz 2022
//
//  Created by влад on 08.07.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var SingleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangeLabels: [UILabel]!
    
    @IBOutlet weak var questionsProgressView: UIProgressView!
    
   private var answerChosen:[Answer] = []{
        didSet{
            print(#line, #function, answerChosen)
        }
    }
    private var currentAnswers: [Answer] {
       currentQuestion.answers
    }
   private var currentQuestion: Questions{
     Questions.all[questionsIndex]
    }
    var questionsIndex = 0 //   организуем счетчик вопросов
    override func viewDidLoad() {
        super.viewDidLoad()
        rangedSlider.maximumValue = 0.9999
        updateUi()
        // Do any additional setup after loading the view.
    }
    
    func updateUi (){ // прячет все стэки кроме тех которые относятся к данному вопросу
        
        func updateSingleStack(){
            
            SingleStackView.isHidden = false
            for(index, button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])// очистка button от предыдущих значений
                button.tag = index
            }
            for (button, answer) in zip(singleButtons, currentAnswers){
                button.setTitle(answer.text, for: [])
            }
        }
        func updateMultipleStack(){
            multipleStackView.isHidden = false
            for label in multiLabels {
                label.text = nil
            }
            for (label, answer) in zip (multiLabels, currentAnswers){
                label.text = answer.text
            }
        }
        func updateRangeStack(){
            rangedStackView.isHidden = false
            rangeLabels.first?.text = currentAnswers.first?.text
            rangeLabels.last?.text = currentAnswers.last?.text
        }
        
        for stackView in [SingleStackView, multipleStackView, rangedStackView]{
            stackView?.isHidden = true
    }
         
        let totalProgress = Float(questionsIndex)/Float(Questions.all.count)
        
        navigationItem.title = "Вопрос №\(questionsIndex + 1)" // отображение номера вопроса в навигейшн баре
        questionLabel.text = currentQuestion.text
        questionsProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type{                              //
        case.single:updateSingleStack()       //
        case.multiple:updateMultipleStack()   //
        case.range:updateRangeStack()        //
            
        }
    }
    
    func nextQuestion (){
         questionsIndex += 1

        if questionsIndex < Questions.all.count{
            updateUi()
        }else{
            performSegue(withIdentifier: "Results segue", sender: nil)
        }
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        print(#line,#function,sender.tag)
        let answers = Questions.all[questionsIndex].answers
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
        
        let answer = answers[index]
        answerChosen.append(answer)
      nextQuestion()
    }
    
    @IBAction func multiButtonPressed (){
        for (index, multiSwitch) in multiSwitches.enumerated(){
            if multiSwitch.isOn && index < currentAnswers.count{
                let answer = currentAnswers[index]
                answerChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed(){
        print(#line, #function)
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count{
            let answer = currentAnswers[index]
            answerChosen.append(answer)
        }
    nextQuestion()
    }
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, answerChosen)
    }
}
