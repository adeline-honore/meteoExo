//
//  DisplayMeteoViewController.swift
//  Meteo
//
//  Created by HONORE Adeline on 17/12/2022.
//

import UIKit

class DisplayMeteoViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var displayMeteoView: DisplayMeteoView!
    
    private let defaultIcon = UIImage(systemName: "sun.min.fill")
    
    private var timerForCity: Timer = Timer()
    private var timerCityMultiplier = 1
    private var weatherService: WeatherServiceProtocol = WeatherService(network: Network())
    private var infos: [InfoMeteo] = []
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayMeteoView = view as? DisplayMeteoView
        displayMeteoView.progressView.progress = 0
        displayMeteoView.startAgainButton.isHidden = true
        
        startProgressView()
        startTimerForCity()
    }
    
    // MARK: - ProgressView
    
    private func startProgressView() {
        
        UIProgressView.animate(withDuration: 60) {
            self.displayMeteoView.progressView.setProgress(1.0, animated: true)
        }
    }
    
    // MARK: - Timer for cities
    
    private func startTimerForCity() {
        timerForCity = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.runTimerForCity), userInfo: nil, repeats: true)
    }
    
    @objc func runTimerForCity() {
        
        let interval = timerCityMultiplier * Int(timerForCity.timeInterval)
                
        switch interval {
        case 10:
            getWeatherInformations(city: City.city10.id)
        case 20:
            getWeatherInformations(city: City.city20.id)
        case 30:
            getWeatherInformations(city: City.city30.id)
        case 40:
            getWeatherInformations(city: City.city40.id)
        case 50:
            getWeatherInformations(city: City.city50.id)
        case 60:
            timerForCity.invalidate()
        default:
            break
        }
        timerCityMultiplier += 1
        
    }
    
    private func getWeatherInformations(city: Int) {
                
        weatherService.getData(city: city) { result in
            switch result {
            case .success(let weather):
                self.infos.append(self.createInfoMeteo(weather: weather))
                print(self.infos)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func createInfoMeteo(weather: WeatherStructure) -> InfoMeteo {
        InfoMeteo(cityName: weather.name, description: weather.weather.first?.description ?? "", temp: "\(kelvinToCelsius(kelvin:weather.main.temp))", icon:getInfoMetoIcon(icon: weather.weather.first?.icon ?? ""))
    }
    
    private func kelvinToCelsius(kelvin: Double) -> String {
        String(format:"%.1f", (kelvin - 273.15)) + " °C"
    }
    
    private func getInfoMetoIcon(icon: String) -> UIImage {
        guard let image = UIImage(named: String(icon)) else { return UIImage() }
        return image
    }
}
