//
//  HomeViewController.swift
//  Meteo
//
//  Created by HONORE Adeline on 17/12/2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    private var homeView: HomeView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeView = view as? HomeView
        homeView.textView.text = Texts.home.value
        setButton(homeView.loadButton)
    }
    

    // MARK: - Tap on load button
}
