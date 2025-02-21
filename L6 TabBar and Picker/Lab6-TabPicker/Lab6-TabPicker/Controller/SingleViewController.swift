//
//  SingleViewController.swift
//  Lab6-TabPicker
//
//  Created by mm on 25/12/2567 BE.
//

import UIKit

class SingleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var lblResult: UILabel!
    let name = ["Mudarmeen", "Thewa", "Pongpanit","Anuchit", "Metha"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //myPicker.set
        let row = myPicker.selectedRow(inComponent: 0)
        lblResult.text = name[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return name[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return name.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return lblResult.text = name[row]
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
