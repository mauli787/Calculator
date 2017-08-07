//
//  ViewController.swift
//  Calculator
//
//  Created by Mac on 29/07/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displaylbl: UILabel!
    
    var displayValue : Double{
        get{
        return Double(displaylbl.text!)!
        }
        set{
        displaylbl.text = String(newValue)
        }
    }
    
    var userIsInTheMiddleOfTyping = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
    }

    
    
    @IBAction func TouchDigitAction(_ sender: UIButton) {
    
        let digit = sender.currentTitle
        
        if userIsInTheMiddleOfTyping{
        
            let currentTextInDisplay = displaylbl.text!
            
            displaylbl.text = currentTextInDisplay + digit!
        }
        else{
           displaylbl.text = digit
            userIsInTheMiddleOfTyping = true
        
        }
    
}
    
    
    @IBAction func DeleteActionButton(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            
            var numChars = displaylbl.text?.characters.count ?? 0 // 0
           
            numChars = displaylbl.text?.characters.count ?? 0
            
            if numChars > 0 {
                
                var name: String = displaylbl.text!
                name.remove(at: name.index(before: name.endIndex))
                print(name)
                
                displaylbl.text = name
                
            }
            else{
            
            displaylbl.text = ""
            
            }
        }
        
    }
    private var brain = CalculatorBrain()
    
         @IBAction func PerformOperationAction(_ sender: UIButton) {
    
        if userIsInTheMiddleOfTyping {
            
        brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        
        }
        if  let mathematicalsymbol = sender.currentTitle {
             brain.performOperation(mathematicalsymbol)
        }
        if  let result = brain.result {
            displayValue = result
        }
    
    }
    
}

