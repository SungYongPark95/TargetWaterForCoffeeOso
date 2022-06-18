//
//  ViewController.swift
//  TargetWaterForCoffee
//
//  Created by Sung Yong Park on 2022/06/09.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let sampleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(sampleView)
        sampleView.backgroundColor = .red
        sampleView.layer.cornerRadius = 100
        // Do any additional setup after loading the view.
    }
}

// MARK: - Using Canvas Preview in SwiftUI for UIKit
struct ViewControllerRepresentable : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = ViewController
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

