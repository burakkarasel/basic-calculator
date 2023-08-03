//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Burak Karasel on 2.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstInput: UITextField!
    @IBOutlet weak var secondInput: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        let resOfValidation = validateInputs(first: firstInput, second: secondInput)
        if resOfValidation[0] == 0 && resOfValidation[1] == 0 {
            result.text = "Only numbers are supported!"
            result.textColor = UIColor.red
            return
        }
        
        result.text = "\(makeOperation(x: resOfValidation[0], y: resOfValidation[1], opt: "+"))"
        result.textColor = UIColor.black
    }
    
    @IBAction func subtract(_ sender: Any) {
        let resOfValidation = validateInputs(first: firstInput, second: secondInput)
        if resOfValidation[0] == 0 && resOfValidation[1] == 0 {
            result.text = "Only numbers are supported!"
            result.textColor = UIColor.red
            return
        }
        
        result.text = "\(makeOperation(x: resOfValidation[0], y: resOfValidation[1], opt: "-"))"
        result.textColor = UIColor.black
    }
    
    @IBAction func multiply(_ sender: Any) {
        let resOfValidation = validateInputs(first: firstInput, second: secondInput)
        if resOfValidation[0] == 0 && resOfValidation[1] == 0 {
            result.text = "Only numbers are supported!"
            result.textColor = UIColor.red
            return
        }
        
        result.text = "\(makeOperation(x: resOfValidation[0], y: resOfValidation[1], opt: "x"))"
        result.textColor = UIColor.black
    }
    
    @IBAction func divide(_ sender: Any) {
        let resOfValidation = validateInputs(first: firstInput, second: secondInput)
        if resOfValidation[0] == 0 && resOfValidation[1] == 0 {
            result.text = "Only numbers are supported!"
            result.textColor = UIColor.red
            return
        }
        if resOfValidation[1] == 0 {
            result.text = "Cannot divide by 0!"
            result.textColor = UIColor.red
            return
        }
        
        result.text = "\(makeOperation(x: resOfValidation[0], y: resOfValidation[1], opt: "/"))"
        result.textColor = UIColor.black
    }
    
    func makeOperation(x : Int, y : Int, opt: String) -> Int {
        switch opt {
        case "+":
            return x + y
        case "-":
            return x - y
        case "x":
            return x * y
        default:
            return x / y
        }
    }
    
    func validateInputs(first: UITextField, second : UITextField) -> ([Int]) {
        var firstOne = first.text
        var secondOne = second.text
        
        if firstOne == nil {
            return [0, 0]
        }
        
        if secondOne == nil {
            return [0, 0]
        }
        
        if let myFirst = Int(firstOne!){
            if let mySecond = Int(secondOne!) {
                return [myFirst, mySecond]
            }
        }
        
        return [0, 0]
    }
}

