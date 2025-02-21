//
//  ViewController.swift
//  MyCalculatorA
//
//  Created by MII-MAC-21 on 21/11/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        result.text = sender.currentTitle
    }
}

