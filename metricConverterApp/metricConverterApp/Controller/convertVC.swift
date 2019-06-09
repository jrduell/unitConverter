//
//  convertVC.swift
//  metricConverterApp
//
//  Created by jacob on 5/27/19.
//  Copyright © 2019 jacob. All rights reserved.
//

import UIKit

class convertVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let currentPrefix: Array = ["nano","micro","milli","centi", "deci", "unit", "deka", "hecto", "kilo", "mega", "giga", "tera"]
    let desiredPrefix: Array = ["nano","micro","milli","centi", "deci", "unit", "deka", "hecto", "kilo", "mega", "giga", "tera"]
    
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var unitTxtField: UITextField!
    @IBOutlet weak var currentSelectBtn: CustomBtn!
    @IBOutlet weak var desiredSelectBtn: CustomBtn!
    @IBOutlet weak var CurrentUnitPickerView: UIPickerView!
    @IBOutlet weak var DesiredUnitPickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CurrentUnitPickerView.dataSource = self
        CurrentUnitPickerView.delegate = self
        
        DesiredUnitPickerView.dataSource = self
        DesiredUnitPickerView.delegate = self
        
        let calcBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcBtn.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        calcBtn.setTitle("Calculate", for: .normal)
        calcBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcBtn.addTarget(self, action: #selector(convertVC.metricConvert), for: .touchUpInside)
        unitTxtField.inputAccessoryView = calcBtn
        
    }
    
    
    //Currentselect button animation
    @IBAction func onCurrentSelectTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: { self.CurrentUnitPickerView.isHidden = !self.CurrentUnitPickerView.isHidden })
    }
    
    
    @IBAction func onDesiredSelectTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: { self.DesiredUnitPickerView.isHidden = !self.DesiredUnitPickerView.isHidden })
    }
    
    
    
    
    
    
    // Current Picker View
    
    //each picker view needs pickerview (numberOfRowsInComponent, didSelectRow) and func numberOfComponents
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return currentPrefix.count
        } else {
            return desiredPrefix.count
      }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            currentSelectBtn.setTitle(currentPrefix[row], for: .normal)
        } else {
            desiredSelectBtn.setTitle(desiredPrefix[row], for: .normal)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            currentUnitLocal = currentPrefix.firstIndex(of: currentPrefix[row])!
            return currentPrefix[row]
        } else {
            desiredUnitLocal = desiredPrefix.firstIndex(of: desiredPrefix[row])!
            return desiredPrefix[row]
        }
    }
    
    
    

    
    //array key conversion to value
    var currentUnitLocal = 0
    var desiredUnitLocal = 0
    
    @objc func metricConvert() {
        
        if let unitSelect = unitTxtField.text {
            if let unit = Double(unitSelect) {
                view.endEditing(true)
                resultLbl.text = "\(calculateLogic.getConverted(currentUnit: currentUnitLocal, desiredUnit: desiredUnitLocal, amount: unit)) \(desiredPrefix[desiredUnitLocal])"
                
                
            }
    
        }
    
    }
    
    
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        resultLbl.text = "Metric Conversion"
        unitTxtField.text = ""
        
    }
    
    
    
    
    
    
}
