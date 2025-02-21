//
//  DoubleViewController.swift
//  Lab6-TabPicker
//
//  Created by mm on 25/12/2567 BE.
//

import UIKit

class DoubleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var lblResult: UILabel!
    
    private let fillingComponent = 0
       private let breadComponent = 1
       private let fillingTypes = [
           "Ham", "Turkey", "Peanut Butter", "Tuna Salad",
           "Chicken Salad", "Roast Beef", "Vegemite"]
       private let breadTypes = [
           "White", "Whole Wheat", "Rye", "Sourdough", "Seven Grain"]
        var filling: String = ""
        var bread: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblResult.layer.cornerRadius = lblResult.frame.width/10
        lblResult.layer.masksToBounds = true
        
        myPicker.layer.cornerRadius = myPicker.frame.width/10
        myPicker.layer.masksToBounds = true
        
        myPicker.selectRow(2, inComponent: 0, animated: true)
        myPicker.selectRow(2, inComponent: 1, animated: true)
        let rowFilling = myPicker.selectedRow(inComponent: 0)
        let rowBread = myPicker.selectedRow(inComponent: 1)
        
        
        filling = fillingTypes[rowFilling]
        bread = breadTypes[rowBread]
        lblResult.text = "You selected \(filling) and \(bread!)"
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == fillingComponent {
            return fillingTypes.count
        }else {
            return breadTypes.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == fillingComponent {
            return fillingTypes[row]
        }else {
            return breadTypes[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == fillingComponent {
            filling = fillingTypes[row]
        }else {
            bread = breadTypes[row]
        }
        lblResult.text = "You selected \(filling) and \(bread ?? "")"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
