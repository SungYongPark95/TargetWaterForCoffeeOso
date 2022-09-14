//
//  LogoUIView.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/15.
//

import Foundation
import UIKit

class LogoUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView(){
        
    }
}
