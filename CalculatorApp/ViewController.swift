//
//  ViewController.swift
//  CalculatorApp_2
//
//  Created by 飯田諒 on 2019/05/08.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var processNumber: UILabel!
    @IBOutlet weak var displayNumber: UILabel!
    var processPrevNumber: String = ""
    var processInputNumber: String = ""
    var processTotalNumber: String = ""
    var prevNumber: String = ""
    var inputNumber: String = ""
    var resultNumber: Int = 0
    var isOpen: Bool = true
    var isCalculated: Bool = false
    var operation: OperationType = .add
    
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var refresh: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var devide: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayNumber.text = "0"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNumber (_ sender: UIButton) {
        if isOpen == true {
            if sender.tag == 0 && prevNumber.count == 0 {
            } else {
                prevNumber += String(sender.tag)
                displayNumber.text = prevNumber
                processPrevNumber = prevNumber
                processNumber.text = processPrevNumber
            }
        } else {
            if sender.tag == 0 && inputNumber.count == 0 {
            } else {
                inputNumber += String(sender.tag)
                displayNumber.text = inputNumber
                processInputNumber = inputNumber
                
                if isCalculated == false {
                processNumber.text = processPrevNumber + processInputNumber
                } else {
                    processNumber.text = processTotalNumber + processInputNumber
                }
            }
        }
    }
    

    @IBAction func popNumber (_ sender: UIButton) {
        let op = Calculations.popNumber(isOpen: isOpen, prevNumber: prevNumber, inputNumber: inputNumber)
        prevNumber = op.prevNumber
        inputNumber = op.inputNumber
        displayNumber.text = op.displayNumber
    }
    
    @IBAction func calculation (_ sender: UIButton) {
        if isOpen == true {
            isOpen = false
            
            if let op = OperationType.init(rawValue: sender.tag) {
                operation = op
                
            }
            if sender.tag == 10 {
                processPrevNumber += "+"
                processNumber.text = processPrevNumber
            } else if sender.tag == 11 {
                processPrevNumber += "-"
                processNumber.text = processPrevNumber
            } else if sender.tag == 12 {
                processPrevNumber += "×"
                processNumber.text = processPrevNumber
            } else if sender.tag == 13 {
                processPrevNumber += "÷"
                processNumber.text = processPrevNumber
            }
        } else {
            if sender.tag == 10 {
                processTotalNumber += "+"
                processNumber.text = processTotalNumber
            } else if sender.tag == 11 {
                processTotalNumber += "-"
                processNumber.text = processTotalNumber
            } else if sender.tag == 12 {
                processTotalNumber += "×"
                processNumber.text = processTotalNumber
            } else if sender.tag == 13 {
                processTotalNumber += "÷"
                processNumber.text = processTotalNumber
            }
            
            if let op = OperationType.init(rawValue: sender.tag) {
                operation = op
                if let prev = Int(prevNumber), let input = Int(inputNumber) {
                    resultNumber = op.calculate(m: prev, n: input)
                    process()
                }
                
            }
            
            
        }
    }

    @IBAction func showResult (_ sender: Any) {
        if let prev = Int(prevNumber), let input = Int(inputNumber) {
            
            if let op = OperationType.init(rawValue: operation.rawValue) {
                resultNumber = op.calculate(m: prev, n: input)
                process()
            }
            
        }
    }
    
    @IBAction func clearAll (_ sender: Any) {
        clear()
    }

    func clear() {
        prevNumber = ""
        inputNumber = ""
        isOpen = true
        displayNumber.text = "0"
    }
    func process() {
        displayNumber.text = String(resultNumber)
        prevNumber = String(resultNumber)
        inputNumber = ""
        processTotalNumber = processPrevNumber + processInputNumber //ここがなんかおかしい
        processNumber.text = processTotalNumber
        processPrevNumber = ""
        processInputNumber = ""
        isCalculated = true
    }
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
//        heightConstraint.constant = self.view.frame.size.height / 1.5
        one.layer.cornerRadius = one.frame.height / 2
        two.layer.cornerRadius = two.frame.height / 2
        three.layer.cornerRadius = three.frame.height / 2
        four.layer.cornerRadius = four.frame.height / 2
        five.layer.cornerRadius = five.frame.height / 2
        six.layer.cornerRadius = six.frame.height / 2
        seven.layer.cornerRadius = seven.frame.height / 2
        eight.layer.cornerRadius = eight.frame.height / 2
        nine.layer.cornerRadius = nine.frame.height / 2
        zero.layer.cornerRadius = zero.frame.height / 2
        equal.layer.cornerRadius = equal.frame.height / 2
        add.layer.cornerRadius = add.frame.height / 2
        minus.layer.cornerRadius = minus.frame.height / 2
        multiply.layer.cornerRadius = multiply.frame.height / 2
        devide.layer.cornerRadius = devide.frame.height / 2
        refresh.layer.cornerRadius = refresh.frame.height / 2
        
    }

}

