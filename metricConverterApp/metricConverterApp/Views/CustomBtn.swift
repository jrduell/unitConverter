//
//  CustomBtn.swift
//  metricConverterApp
//
//  Created by jacob on 5/27/19.
//  Copyright © 2019 jacob. All rights reserved.
//

import UIKit

@IBDesignable

class CustomBtn: UIButton {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        layer.cornerRadius = 1.0
        layer.borderWidth = 3.0
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        titleLabel?.font = UIFont(name: "Avenir-Bold", size: 17)
    }

}
