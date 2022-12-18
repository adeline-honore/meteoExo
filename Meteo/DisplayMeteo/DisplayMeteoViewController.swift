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
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayMeteoView = view as? DisplayMeteoView
        displayMeteoView.progressView.progress = 0
        displayMeteoView.startAgainButton.isHidden = true
        
        startProgressView()
    }
    
    private func startProgressView() {
        
        UIProgressView.animate(withDuration: 60) {
            self.displayMeteoView.progressView.setProgress(1.0, animated: true)
        }
    }
    
}
