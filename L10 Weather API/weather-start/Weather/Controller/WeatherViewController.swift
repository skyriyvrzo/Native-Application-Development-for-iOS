//
//  ViewController.swift


import UIKit
import CoreLocation

class WeatherViewController: UIViewController, WeatherManagerDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var aboutButton: UIButton!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
        aboutButton.layer.cornerRadius = 10
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.borderColor = UIColor.orange.cgColor
        
        weatherManager.fetchWeatehr(cityName: "Bangkok")
    }

    
    @IBAction func searchTapped(_ sender: Any) {
//        print(searchTextField.text!)
        
        if let city = searchTextField.text {
            weatherManager.fetchWeatehr(cityName: city)
        }
        searchTextField.text = ""
    
        hideKeyboard()
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            print(weather)
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionImageName)
            self.cityLabel.text = weather.cityName
            self.descriptionLabel.text = weather.descriptionName
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error)
    }
    @IBAction func about(_ sender: Any) {
        let alertController = UIAlertController(title: "Developer", message: "Thewa Laokasikan \nID: 6614110014", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

