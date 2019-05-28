//
//  convertVC.swift
//  metricConverterApp
//
//  Created by jacob on 5/27/19.
//  Copyright © 2019 jacob. All rights reserved.
//

import UIKit

class convertVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let prefix: Array = ["nano", "micro", "milli", "centi", "deci", "unit", "deka", "hecto", "kilo", "mega", "giga", "tera"]
    
    @IBOutlet weak var selectBtn: CustomBtn!
    @IBOutlet weak var unitDropDown: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        unitDropDown.dataSource = self
        unitDropDown.delegate = self
    }
    
    @IBAction func onSelectTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: { self.unitDropDown.isHidden = !self.unitDropDown.isHidden })
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return prefix.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectBtn.setTitle(prefix[row], for: .normal)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return prefix[row]
    }
    
    

}
