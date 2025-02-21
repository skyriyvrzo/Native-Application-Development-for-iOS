//
//  ViewController.swift
//  Lab2-6614110014
//
//  Created by MII-MAC-21 on 28/11/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputF: UITextField!
    @IBOutlet weak var outputC: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func convertTemp(_ sender: UIButton) {
        let f = Double(inputF.text!)!
        let c = (f - 32) * 5 / 9
        outputC.text = String(format: "%.2f Celsius", c)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

