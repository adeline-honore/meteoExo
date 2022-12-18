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
    
    private var timerForCity: Timer = Timer()
    private var timerCityMultiplier = 1
    
    
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
            print(City.city10)
        case 20:
            print(City.city20)
        case 30:
            print(City.city30)
        case 40:
            print(City.city40)
        case 50:
            print(City.city50)
        case 60:
            timerForCity.invalidate()
        default:
            break
        }
        timerCityMultiplier += 1
    }
}
