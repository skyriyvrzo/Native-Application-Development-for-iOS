//
//  FruitViewController.swift
//  Lab6-6614110014
//
//  Created by MII-MAC-21 on 26/12/2567 BE.
//

import UIKit
import AudioToolbox

class FruitViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var lblWin: UILabel!
    @IBOutlet weak var aboutButton: UIButton!
    
    private var images: [UIImage]!
    private var winSoundID: SystemSoundID = 0
    private var crunchSoundID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinButton.layer.cornerRadius = spinButton.frame.width / 8
        spinButton.layer.masksToBounds = true
        spinButton.layer.borderWidth = 1
        spinButton.layer.borderColor = UIColor.blue.cgColor
        
        aboutButton.layer.cornerRadius = aboutButton.frame.width / 15
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.borderColor = UIColor.blue.cgColor
        
        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!,
        ]
        
        lblWin.text = " "
        initSpin()
    }
    
    func initSpin() {
        for i in 0..<5 {
            let newValue = Int.random(in: 0..<images.count)
            myPicker.selectRow(newValue, inComponent: i, animated: true)
            myPicker.reloadComponent(i)
        }
    }
    
    func showButton() {
        spinButton.isHidden = false
    }
    
    func playWinSound() {
        if winSoundID == 0 {
            let soundURL = Bundle.main.url(forResource: "win", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        lblWin.text = "WINNER!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {self.showButton()})
        
    }
    
    @IBAction func spin(_ sender: Any) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        for i in 0..<5 {
            let newValue = Int.random(in: 0..<images.count)
            if newValue == lastVal {
                numInRow += 1
            } else {
                numInRow = 1
            }
            
            lastVal = newValue
            myPicker.selectRow(newValue, inComponent: i, animated: true)
            myPicker.reloadComponent(i)
            
            if numInRow >= 3 {
                win = true
            }
        }
        
        if crunchSoundID == 0 {
            let soundURL = Bundle.main.url(forResource: "crunch", withExtension: "wav")! as CFURL
            AudioServicesCreateSystemSoundID(soundURL, &crunchSoundID)
        }
        AudioServicesPlaySystemSound(crunchSoundID)
        if win {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {self.playWinSound()})
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {self.showButton()})
        }
        
        spinButton.isHidden = true
        lblWin.text = " "
    }
    
    @IBAction func about(_ sender: UIButton) {
        let alert = UIAlertController(title: "Developer", message: "Name: Thewa Laokasikan\nID: 6614110014", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        images.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
    
}
