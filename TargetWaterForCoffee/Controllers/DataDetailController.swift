//
//  DataDetailController.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/31.
//

import Foundation
import UIKit

class DataDetailController: UIViewController {
    
    let graphImageUIView = UIView()
    let graphImageView = UIImageView()
    let graphDrawPointUIView = UIView()
    let graphPointImageView = UIImageView()
    
    let filterUIView = UIView()
    let filterLabel = UILabel()
    let filterDataTextView = UITextView()
    let multifuncButton = UIButton(type: .system)
    
    let mesureDataUIView = UIView()
    let totalHardnessLabel = UILabel()
    let totalHardnessTextView = UITextView()
    let alkalinityLabel = UILabel()
    let alkalinityDataTextView = UITextView()
    let phLabel = UILabel()
    let phDataTextView = UITextView()
    
    let memoUIView = UIView()
    let memoLabel = UILabel()
    let memoDataLabel = UITextView()
    
    var dotXAnchor: NSLayoutConstraint?
    var dotYAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// [MARK] Set UI
extension DataDetailController{
    func setUI(){
        // navigation
        setTitle(title: "2022년 8월 31일", subTitle: "10:02 AM")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        [graphImageUIView, graphImageView, graphDrawPointUIView, graphPointImageView, filterUIView,
         filterLabel, filterDataTextView, multifuncButton, mesureDataUIView, totalHardnessLabel,
         totalHardnessTextView, alkalinityLabel, alkalinityDataTextView, phLabel, phDataTextView,
         memoUIView, memoLabel, memoDataLabel].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // graph - UIView
            graphImageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            graphImageUIView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            graphImageUIView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            graphImageUIView.heightAnchor.constraint(equalToConstant: 325),
            
            // graph - ImageView
            graphImageView.widthAnchor.constraint(equalToConstant: 360),
            graphImageView.heightAnchor.constraint(equalToConstant: 288),
            graphImageView.centerXAnchor.constraint(equalTo:graphImageUIView.centerXAnchor),
            graphImageView.centerYAnchor.constraint(equalTo: graphImageUIView.centerYAnchor),
            
            // graph - pointUIView
            graphDrawPointUIView.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 32),
            graphDrawPointUIView.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 69),
            graphDrawPointUIView.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -32),
            graphDrawPointUIView.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -64),
            
            // filter UIView
            filterUIView.topAnchor.constraint(equalTo: graphImageView.bottomAnchor, constant: 30),
            filterUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filterUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            filterUIView.heightAnchor.constraint(equalToConstant: 54),
            
            // filter Label
            filterLabel.topAnchor.constraint(equalTo: filterUIView.topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: filterUIView.leadingAnchor, constant: 30),
            filterLabel.widthAnchor.constraint(equalToConstant: 60),
            
            // filter Data TextView
            filterDataTextView.topAnchor.constraint(equalTo: filterLabel.bottomAnchor),
            filterDataTextView.bottomAnchor.constraint(equalTo: filterUIView.bottomAnchor),
            filterDataTextView.leadingAnchor.constraint(equalTo: filterUIView.leadingAnchor, constant: 25),
            filterDataTextView.widthAnchor.constraint(equalToConstant: 250),
            
            // multifunc Button
            multifuncButton.widthAnchor.constraint(equalToConstant: 30),
            multifuncButton.heightAnchor.constraint(equalToConstant: 30),
            multifuncButton.centerYAnchor.constraint(equalTo: filterUIView.centerYAnchor),
            multifuncButton.trailingAnchor.constraint(equalTo: filterUIView.trailingAnchor, constant: -30),
            
            // mesuer Data UIView
            mesureDataUIView.topAnchor.constraint(equalTo: filterUIView.bottomAnchor, constant: 30),
            mesureDataUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mesureDataUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mesureDataUIView.heightAnchor.constraint(equalToConstant: 57),
            
            // total Hardness Label
            totalHardnessLabel.topAnchor.constraint(equalTo: mesureDataUIView.topAnchor),
            totalHardnessLabel.leadingAnchor.constraint(equalTo: mesureDataUIView.leadingAnchor, constant: 30),
            totalHardnessLabel.trailingAnchor.constraint(equalTo: alkalinityLabel.leadingAnchor),
            totalHardnessLabel.bottomAnchor.constraint(equalTo: totalHardnessTextView.topAnchor),
            totalHardnessLabel.widthAnchor.constraint(equalToConstant: 105),
            
            // total Hardness Data Label
            totalHardnessTextView.topAnchor.constraint(equalTo: totalHardnessLabel.bottomAnchor),
            totalHardnessTextView.leadingAnchor.constraint(equalTo: mesureDataUIView.leadingAnchor, constant: 25),
            totalHardnessTextView.trailingAnchor.constraint(equalTo: alkalinityDataTextView.leadingAnchor),
            totalHardnessTextView.bottomAnchor.constraint(equalTo: mesureDataUIView.bottomAnchor),
            totalHardnessTextView.widthAnchor.constraint(equalToConstant: 105),
            
            // alkalinity Label
            alkalinityLabel.topAnchor.constraint(equalTo: mesureDataUIView.topAnchor),
            alkalinityLabel.leadingAnchor.constraint(equalTo: totalHardnessLabel.trailingAnchor),
            alkalinityLabel.trailingAnchor.constraint(equalTo: phLabel.leadingAnchor),
            alkalinityLabel.bottomAnchor.constraint(equalTo: alkalinityDataTextView.topAnchor),
            alkalinityLabel.widthAnchor.constraint(equalToConstant: 105),
            
            // alkalinity Data TextView
            alkalinityDataTextView.topAnchor.constraint(equalTo: alkalinityLabel.bottomAnchor),
            alkalinityDataTextView.leadingAnchor.constraint(equalTo: totalHardnessTextView.trailingAnchor),
            alkalinityDataTextView.trailingAnchor.constraint(equalTo: phDataTextView.leadingAnchor),
            alkalinityDataTextView.bottomAnchor.constraint(equalTo: mesureDataUIView.bottomAnchor),
            alkalinityDataTextView.widthAnchor.constraint(equalToConstant: 105),
            
            // ph Label
            phLabel.topAnchor.constraint(equalTo: mesureDataUIView.topAnchor),
            phLabel.leadingAnchor.constraint(equalTo: alkalinityLabel.trailingAnchor),
            phLabel.trailingAnchor.constraint(equalTo: mesureDataUIView.trailingAnchor, constant: 30),
            phLabel.bottomAnchor.constraint(equalTo: phDataTextView.topAnchor),
            phLabel.widthAnchor.constraint(equalToConstant: 105),
            
            // alkalinity Data TextView
            phDataTextView.topAnchor.constraint(equalTo: phLabel.bottomAnchor),
            phDataTextView.leadingAnchor.constraint(equalTo: alkalinityDataTextView.trailingAnchor),
            phDataTextView.trailingAnchor.constraint(equalTo: mesureDataUIView.trailingAnchor, constant: 30),
            phDataTextView.bottomAnchor.constraint(equalTo: mesureDataUIView.bottomAnchor),
            phDataTextView.widthAnchor.constraint(equalToConstant: 105),
            
            // memo UIView
            memoUIView.topAnchor.constraint(equalTo: mesureDataUIView.bottomAnchor, constant: 30),
            memoUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            memoUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            memoUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            
            // memo Label
            memoLabel.topAnchor.constraint(equalTo: memoUIView.topAnchor),
            memoLabel.leadingAnchor.constraint(equalTo: memoUIView.leadingAnchor, constant: 30),
            memoLabel.widthAnchor.constraint(equalToConstant: 50),
            memoLabel.bottomAnchor.constraint(equalTo: memoDataLabel.topAnchor),
            
            // memo Data TextView
            memoDataLabel.topAnchor.constraint(equalTo: memoLabel.bottomAnchor),
            memoDataLabel.leadingAnchor.constraint(equalTo: memoUIView.leadingAnchor, constant: 25),
            memoDataLabel.trailingAnchor.constraint(equalTo: memoUIView.trailingAnchor, constant: 30),
            memoDataLabel.bottomAnchor.constraint(equalTo: memoUIView.bottomAnchor, constant: 20)
        ])
        
        // graph Image
        let graphImage = UIImage(named: "graph")
        graphImageView.image = graphImage
        
        // graph point
        graphDrawPointUIView.backgroundColor = .clear
        let pointImage = UIImage(named: "GraphDotPointer")
        graphPointImageView.image = pointImage
        
        // filter Label
        filterLabel.text = "Filter"
        filterLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        filterLabel.textColor = .gray
        
        // filter Data Text View
        filterDataTextView.text = "Claris Prime"
        filterDataTextView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        filterDataTextView.textColor = .gray
        filterDataTextView.isEditable = false
        
        // multiFunc Button
        multifuncButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        multifuncButton.setTitle("● ● ●", for: .normal)
        multifuncButton.setTitleColor(.black, for: .normal)
        multifuncButton.addTarget(self, action: #selector(didTapMuitiFunctionButton(_:)), for: .touchUpInside)
        
        // mesure labels
        [totalHardnessLabel, alkalinityLabel, phLabel].forEach{
            $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .gray
        }
        totalHardnessLabel.text = "Total Hardness"
        alkalinityLabel.text = "Alkalinity"
        phLabel.text = "PH"
        
        // mesure Data Text View
        [totalHardnessTextView, alkalinityDataTextView, phDataTextView].forEach{
            $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            $0.textColor = .black
            $0.isEditable = false
        }
        totalHardnessTextView.text = "60"
        alkalinityDataTextView.text = "40"
        phDataTextView.text = "3"
        
        // set dot position
        let x = (290 / 120) * (Double(alkalinityDataTextView.text ?? "") ?? 0)
        let y = (-220 / 200) * (Double(totalHardnessTextView.text ?? "") ?? 0)
        dotXAnchor = graphPointImageView.centerXAnchor.constraint(equalTo: graphDrawPointUIView.leadingAnchor, constant: x)
        dotXAnchor?.isActive = true
        dotYAnchor = graphPointImageView.centerYAnchor.constraint(equalTo: graphDrawPointUIView.bottomAnchor, constant: y)
        dotYAnchor?.isActive = true
        
        // memo Label
        memoLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        memoLabel.textColor = .lightGray
        memoLabel.text = "Memo"
        
        // memo Data Text View
        memoDataLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        memoDataLabel.textContainerInset.right = 50
        memoDataLabel.textContainerInset.left = .zero
        memoDataLabel.textColor = .lightGray
        memoDataLabel.isEditable = false
        memoDataLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
    }
}

// [MARK] Button Function
extension DataDetailController{
    @objc
    private func didTapBarButton(_ sender: UIBarButtonItem){
        if sender == navigationItem.rightBarButtonItem{
            let DataDeatilShareController = UINavigationController(rootViewController: DataDeatilShareController())
            DataDeatilShareController.modalPresentationStyle = .overCurrentContext
//            DataDeatilShareController.delegate = self
            present(DataDeatilShareController, animated: false)
        } else{
            self.dismiss(animated: true)
        }
    }
    
    @objc
    private func didTapMuitiFunctionButton(_ sender: UIButton){
        let DataDetailUpDelController = UINavigationController(rootViewController: DataDetailUpDelController())
        DataDetailUpDelController.modalPresentationStyle = .overCurrentContext
        present(DataDetailUpDelController, animated: false)
    }
}

extension DataDetailController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {

    }
}

// [MARK] Function
extension DataDetailController{
    func setTitle(title: String, subTitle: String){
        let main = UILabel()
        main.text = title
        main.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        main.sizeToFit()
        
        let sub = UILabel()
        sub.text = subTitle
        sub.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        sub.textColor = .lightGray
        sub.textAlignment = .center
        sub.sizeToFit()
        
        let titleStackView = UIStackView(arrangedSubviews: [main, sub])
        titleStackView.distribution = .equalSpacing
        titleStackView.axis = .vertical
        titleStackView.alignment = .center
        
        let width = max(main.frame.size.width, sub.frame.size.width)
        titleStackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        main.sizeToFit()
        sub.sizeToFit()
        
        self.navigationItem.titleView = titleStackView
    }
}

// [Mark] Data Detail Update Delete Controller Protocol
extension DataDetailController: UpdateProtocol{
    func update(){
        print("?")
        [self.filterDataTextView, self.totalHardnessTextView, self.alkalinityDataTextView, self.phDataTextView].forEach{
            $0.textColor = .systemBlue
            $0.isEditable = true
        }
    }
}



