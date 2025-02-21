//
//  ViewController.swift
//  MCal
//
//  Created by mm on 12/12/2566 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var equ: UILabel!
    @IBOutlet weak var result: UILabel!
    var first = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func number(_ sender: UIButton) {
        let num = sender.titleLabel?.text

        if num == "=" {
            let mathExpression = NSExpression(format: equ.text!)
            let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double
            result.text = "\(mathValue!)"
            first = true
        } else {
            if(first) {
                equ.text = num
                first = false
            } else {
                equ.text?.append(num!)
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        equ.text = ""
        result.text = ""
    }
    
    @IBAction func about(_ sender: UIButton) {
        let alert = UIAlertController(title: "Developer", message: "Name: Thewa Laokasikan\nID: 6614110014", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        let num = sender.titleLabel?.text
        
        if num == "%" {
            result.text = "\(Double(equ.text!)! / 100)"
            first = true
        }else {
            if(first){
                equ.text = num
                first = false
            } else {
                equ.text?.append(num!)
            }
        }
    }
    
    @IBAction func factorial(_ sender: UIButton) {
        let num = sender.titleLabel?.text
        
        if num == "!" {
            result.text = "\(factorial(Int(equ.text!)!))"
            first = true
        }else {
            if(first){
                equ.text = num
                first = false
            } else {
                equ.text?.append(num!)
            }
        }
    }
    
    func factorial(_ n: Int) -> Double {
      return (1...n).map(Double.init).reduce(1.0, *)
    }
}

