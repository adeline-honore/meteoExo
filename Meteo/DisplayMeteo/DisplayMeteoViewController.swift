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
    
    private var timerUnlimited: Timer = Timer()
    private var timerUnlimitedMultiplier = 1
    private var messageNumber: Int = 1
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayMeteoView = view as? DisplayMeteoView
        
        startTimerUnlimited()
        displayMeteoView.messageLabel.text = "..."
        
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        
        loadMeteoData()
    }
    
    private func loadMeteoData() {
        displayMeteoView.progressView.progress = 0
        displayMeteoView.startAgainButton.isHidden = true
        
        tableView.isHidden = true
        
        startProgressView()
        startTimerForCity()
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: "MeteoTableViewCell", bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: MeteoTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
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
            displayMeteoView.progressView.isHidden = true
            displayMeteoView.startAgainButton.isHidden = false
            displayMeteoInfo()
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
            case .failure(_):
                self.popupMessage(element: .decodingError)
            }
        }
    }
    
    private func createInfoMeteo(weather: WeatherStructure) -> InfoMeteo {
        InfoMeteo(cityName: weather.name, description: weather.weather.first?.description ?? "", temp: "\(kelvinToCelsius(kelvin:weather.main.temp))", icon: getInfoMetoIcon(icon: weather.weather.first?.icon ?? ""))
    }
    
    private func kelvinToCelsius(kelvin: Double) -> String {
        String(format:"%.1f", (kelvin - 273.15)) + " °C"
    }
    
    private func getInfoMetoIcon(icon: String) -> UIImage {
        guard let image = UIImage(named: String(icon)) else { return UIImage(systemName: "sun.min.fill") ?? UIImage() }
        return image
    }
    
    private func displayMeteoInfo() {
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    // MARK: - Unlimited timer
    
    private func startTimerUnlimited() {
        timerUnlimited = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(self.runtimerUnlimited), userInfo: nil, repeats: true)
    }
    
    @objc func runtimerUnlimited() {
        if messageNumber == 1 {
            displayMeteoView.messageLabel.text = Texts.unlimitedMessage1.value
            messageNumber += 1
        } else if messageNumber == 2 {
            displayMeteoView.messageLabel.text = Texts.unlimitedMessage2.value
            messageNumber += 1
        } else if messageNumber == 3 {
            displayMeteoView.messageLabel.text = Texts.unlimitedMessage3.value
            messageNumber = 1
        }
    }
    
    // MARK: - Start again button
    
    @IBAction func didTapStartAgainButton() {
        loadMeteoData()
    }
}

extension DisplayMeteoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MeteoTableViewCell.identifier) as? MeteoTableViewCell ?? MeteoTableViewCell()
        
        if infos.isEmpty {
            popupMessage(element: .noData)
        }
        
        cell.configure(infoMeteo: infos[indexPath.row])
        
        return cell
    }
}
