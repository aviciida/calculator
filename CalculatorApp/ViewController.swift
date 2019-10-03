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
    
    var viewModel: CalculatorViewModel = CalculatorViewModel()
    
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
        viewModel.processNumberHandler = {[weak self] newProcessNumber in
            self?.processNumber.text = newProcessNumber
        }
        
        viewModel.displayNumberHandler = { [weak self] newDisplayNumber in
            self?.displayNumber.text = newDisplayNumber
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNumber (_ sender: UIButton) {
        viewModel.appendNumber(senderTag: sender.tag)
    }
    

    @IBAction func popNumber (_ sender: UIButton) {
        viewModel.popNumber()
    }
    
    @IBAction func calculation (_ sender: UIButton) {
        viewModel.calculationDidTap(senderTag: sender.tag)
    }

    @IBAction func showResult (_ sender: Any) {
        viewModel.didTapShowResult()
    }
    
    @IBAction func clearAll (_ sender: Any) {
        viewModel.clear()
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

