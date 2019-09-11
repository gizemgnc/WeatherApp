//
//  ViewController.swift
//  WeatherApp
//
//  Created by Gizem Genc on 11.09.2019.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showButton.layer.cornerRadius = 7
        showButton.layer.masksToBounds = true
    }
    
    
    @IBAction func goToTodayWeather(_ sender: Any) {
        
        if cityName.text == "" {
            let alert = UIAlertController(title: "Hata var!", message: "Lütfen Şehir Adını Boş Bırakmayınız..", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "TAMAM", style: .cancel, handler: nil)
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
            
        }else{
            if let TodayWeatherViewController = storyboard?.instantiateViewController(withIdentifier: "TodayWeatherTableViewController") as? TodayWeatherTableViewController{
                
                TodayWeatherViewController.cityName = self.cityName.text!
                self.show(TodayWeatherViewController, sender: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}

