//
//  ViewController.swift
//  metricConverterApp
//
//  Created by jacob on 5/27/19.
//  Copyright © 2019 jacob. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var userData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userData = User()
    }
    
    @IBAction func unwindToMainVC(unwindSegue: UIStoryboardSegue) {
        
    }

    @IBAction func onMetricTapped(_ sender: Any) {
        performSegue(withIdentifier: "convertVCSegue", sender: self)
        
    }
    
    @IBAction func onVolumeTapped(_ sender: Any) {
        performSegue(withIdentifier: "findVolumeVCSegue", sender: self)
    }
    
    @IBAction func onAreaTapped(_ sender: Any) {
        performSegue(withIdentifier: "findAreaVCSegue", sender: self)
    }
    
    func selectMath(mathType: String) {
        performSegue(withIdentifier: "convertVCSegue", sender: self)
    }
    
    
    
    
}

