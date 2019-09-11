//
//  TodayWeatherTableViewController.swift
//  WeatherApp
//
//  Created by Gizem Genc on 11.09.2019.
//

import UIKit

class TodayWeatherTableViewController: UITableViewController {
    
    var cityName = ""
    var currentWeather = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    tableView.tableFooterView = UIView()
        
        getTodayResult()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayWeatherCell", for: indexPath) as! TodayWeatherTableViewCell
            
            cell.selectedText.text = "Seçtiğiniz Şehir : \(cityName)"
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayWeatherResultCell", for: indexPath) as! TodayWeatherResultTableViewCell
            cell.resultText.text = currentWeather
            return cell
        }
    }
    
    func getTodayResult(){
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=b8631561de8eaf28147dd031b2edfbe1"){
            let request = URLRequest(url: url);
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error == nil{
                    
                    if let incomingData = data{
                        
                        do{
                            
                            let jsonResult = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject;
                    
                            let weather = jsonResult["weather"] as! NSArray;
                            
                            let weather1 = weather.firstObject as! [String : AnyObject];
                            
                            if let description = weather1["description"] as? String{
                                
                           
                                DispatchQueue.main.sync(execute: {
                                    self.currentWeather = description;
                                    
                                    self.tableView.reloadData();
                                })
                                
                            }
                            
                        }catch{
                            print("Hata oluştu");
                        }
               
                    }
                    
                }
            }
            
            task.resume();
            
        }
    }
    
    }
 

