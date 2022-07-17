//
//  ViewController.swift
//  TargetWaterForCoffee
//
//  Created by Sung Yong Park on 2022/06/09.
//

import UIKit
import SwiftUI


///
class ViewController: UIViewController, UISearchBarDelegate {
    
    let mainView = MainListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setMainListView()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func setNavBar(){
        self.title = "LIST"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease")?.withConfiguration(UIImage.SymbolConfiguration(weight: .bold)),
            style: .done,
            target: self,
            action: nil
        )
    }
    
    
    
    func setMainListView(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(view.safeAreaLayoutGuide)
//            make.edges.equalToSuperview()
        }
        mainView.searchBar.delegate = self
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

