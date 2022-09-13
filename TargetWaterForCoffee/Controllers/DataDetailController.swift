//
//  DataDetailController.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/08/31.
//

import Foundation
import UIKit
import CoreData

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
    let memoDataTextView = UITextView()
    
    let saveButton = UIButton(type: .system)
    
    var dotXAnchor: NSLayoutConstraint?
    var dotYAnchor: NSLayoutConstraint?
    
    var container: NSPersistentContainer?
    let coreDataManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        swipeRecognizer()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
}

// [MARK] Set UI
extension DataDetailController{
    func setUI(){
        // navigation
        let date = "2022년 8월 31일"
        let time = "10:02 AM"
        setTitle(title: date, subTitle: time)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.titleView?.backgroundColor = .white
        
        [graphImageUIView, graphImageView, graphDrawPointUIView, graphPointImageView,
         filterUIView, filterLabel, filterDataTextView, multifuncButton, mesureDataUIView,
         totalHardnessLabel, totalHardnessTextView, alkalinityLabel, alkalinityDataTextView,
         phLabel, phDataTextView, memoUIView, memoLabel, memoDataTextView, saveButton].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // graph - UIView
            graphImageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            graphImageUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            graphImageUIView.widthAnchor.constraint(equalToConstant: 380),
            graphImageUIView.heightAnchor.constraint(equalToConstant: 320),
            
            // graph - ImageView
            graphImageView.centerXAnchor.constraint(equalTo:graphImageUIView.centerXAnchor),
            graphImageView.centerYAnchor.constraint(equalTo: graphImageUIView.centerYAnchor),
            graphImageView.widthAnchor.constraint(equalToConstant: 352),
            graphImageView.heightAnchor.constraint(equalToConstant: 288),
            
            // graph - pointUIView
            graphDrawPointUIView.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 28),
            graphDrawPointUIView.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 66),
            graphDrawPointUIView.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -29),
            graphDrawPointUIView.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -61),
            
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
            phLabel.trailingAnchor.constraint(equalTo: mesureDataUIView.trailingAnchor, constant: -30),
            phLabel.bottomAnchor.constraint(equalTo: phDataTextView.topAnchor),
            phLabel.widthAnchor.constraint(equalToConstant: 105),
            
            // ph Data TextView
            phDataTextView.topAnchor.constraint(equalTo: phLabel.bottomAnchor),
            phDataTextView.leadingAnchor.constraint(equalTo: alkalinityDataTextView.trailingAnchor),
            phDataTextView.trailingAnchor.constraint(equalTo: mesureDataUIView.trailingAnchor, constant: -30),
            phDataTextView.bottomAnchor.constraint(equalTo: mesureDataUIView.bottomAnchor),
            phDataTextView.widthAnchor.constraint(equalToConstant: 105),
            
            // memo UIView
            memoUIView.topAnchor.constraint(equalTo: mesureDataUIView.bottomAnchor, constant: 20),
            memoUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            memoUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            memoUIView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -30),
            
            // memo Label
            memoLabel.topAnchor.constraint(equalTo: memoUIView.topAnchor),
            memoLabel.leadingAnchor.constraint(equalTo: memoUIView.leadingAnchor, constant: 30),
            memoLabel.widthAnchor.constraint(equalToConstant: 50),
            memoLabel.heightAnchor.constraint(equalToConstant: 25),
            
            // memo Data TextView
            memoDataTextView.topAnchor.constraint(equalTo: memoLabel.bottomAnchor, constant: 5),
            memoDataTextView.leadingAnchor.constraint(equalTo: memoUIView.leadingAnchor, constant: 25),
            memoDataTextView.trailingAnchor.constraint(equalTo: memoUIView.trailingAnchor, constant: -20),
            memoDataTextView.bottomAnchor.constraint(equalTo: memoUIView.bottomAnchor, constant: -10),
            
            // save Button
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 49)
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
        filterLabel.textColor = .darkGray
        
        // filter Data Text View
        filterDataTextView.text = "Claris Prime"
        filterDataTextView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        filterDataTextView.textColor = .darkGray
        filterDataTextView.isEditable = false
        filterDataTextView.isScrollEnabled = false
        
        // multiFunc Button
        multifuncButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        multifuncButton.setTitle("● ● ●", for: .normal)
        multifuncButton.setTitleColor(.black, for: .normal)
        multifuncButton.addTarget(self, action: #selector(didTapMuitiFunctionButton(_:)), for: .touchUpInside)
        
        // mesure labels
        [totalHardnessLabel, alkalinityLabel, phLabel].forEach{
            $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .darkGray
        }
        totalHardnessLabel.text = "Total Hardness"
        alkalinityLabel.text = "Alkalinity"
        phLabel.text = "PH"
        
        // mesure Data Text View
        [totalHardnessTextView, alkalinityDataTextView, phDataTextView].forEach{
            $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            $0.textColor = .darkGray
            $0.isEditable = false
            $0.keyboardType = .numberPad
            $0.isScrollEnabled = false
        }
        totalHardnessTextView.text = "100"
        alkalinityDataTextView.text = "40"
        phDataTextView.text = "3"
        
        // set dot position
        let x = (285 / 120) * (Double(alkalinityDataTextView.text ?? "") ?? 0)
        let y = (-221 / 200) * (Double(totalHardnessTextView.text ?? "") ?? 0)
        dotXAnchor = graphPointImageView.centerXAnchor.constraint(equalTo: graphDrawPointUIView.leadingAnchor, constant: x)
        dotXAnchor?.isActive = true
        dotYAnchor = graphPointImageView.centerYAnchor.constraint(equalTo: graphDrawPointUIView.bottomAnchor, constant: y)
        dotYAnchor?.isActive = true
        
        // memo Label
        memoLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        memoLabel.textColor = .darkGray
        memoLabel.text = "Memo"
        
        // memo Data Text View
        memoDataTextView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        memoDataTextView.textContainerInset.left = .zero
        memoDataTextView.textColor = .darkGray
        memoDataTextView.isEditable = false
        memoDataTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
        memoDataTextView.textContainerInset.top = 0
        
        // save Button
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("저장하기", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        saveButton.addTarget(self, action: #selector(didTapSaveButton(_:)), for: .touchUpInside)
        saveButton.layer.cornerRadius = 10
        saveButton.isHidden = true
    }
}

// [MARK] Button Function
extension DataDetailController: UINavigationControllerDelegate{
    @objc
    private func didTapBarButton(_ sender: UIBarButtonItem){
        if sender == navigationItem.rightBarButtonItem{
            let dataDetailShareController = DataDeatilShareController()
            dataDetailShareController.shareDelegate = self
            let naviagtionController = UINavigationController(rootViewController: dataDetailShareController)
            naviagtionController.modalPresentationStyle = .overCurrentContext
            present(naviagtionController, animated: false)
        } else{
            self.dismiss(animated: true)
        }
    }
    
    @objc
    private func didTapMuitiFunctionButton(_ sender: UIButton){
        let dataDetailUpDelController = DataDetailUpDelController()
        dataDetailUpDelController.updateDelegate = self
        let DataDetailUpDelController = UINavigationController(rootViewController: dataDetailUpDelController)
        DataDetailUpDelController.modalPresentationStyle = .overCurrentContext
        present(DataDetailUpDelController, animated: false)
    }
    
    @objc
    private func didTapSaveButton(_ sender: UIButton){
        if Int(totalHardnessTextView.text)! >= 200 || Int(alkalinityDataTextView.text)! >= 120 ||
            Int(phDataTextView.text)! >= 10 {
            let message = "입력한 데이터의 크기가 적절하지 않습니다."
            let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default){_ in 
                self.totalHardnessTextView.text = "0"
                self.alkalinityDataTextView.text = "0"
                self.phDataTextView.text = "0"
            }
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true)
        } else {
            // CoreData - Update
            
            // set title
            let date = "2022년 8월 31일"
            let time = "10:02 AM"
            setTitle(title: date, subTitle: time)
            
            // show graph
            self.graphImageView.isHidden = false
            self.graphPointImageView.isHidden = false
            self.view.frame.origin.y = 0
            self.view.endEditing(true)
            
            // activate Data TextView
            [self.filterDataTextView, self.totalHardnessTextView, self.alkalinityDataTextView,
             self.phDataTextView, self.memoDataTextView].forEach {
                $0.isEditable = false
            }
            
            // show save Button
            self.saveButton.isHidden = true
            
            // deactivate Buttons
            navigationItem.rightBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.tintColor = .none
            multifuncButton.isHidden = false
        }
    }
}

// [ MARK ] UISheet Presentation Controller Delegate
extension DataDetailController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {

    }
}

// [MARK] Function
extension DataDetailController {
    func setTitle(title: String, subTitle: String) {
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

// [ MARK ] Keyboard Set
extension DataDetailController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.graphImageView.isHidden = false
        self.graphPointImageView.isHidden = false
        self.view.frame.origin.y = 0
        self.view.endEditing(true)
    }
    @objc func keyboardWillShow(_ sender:Notification) {
        self.graphImageView.isHidden = true
        self.graphPointImageView.isHidden = true
        self.view.frame.origin.y = 0
        self.view.frame.origin.y = -320
    }
}
extension DataDetailController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.frame.origin.y = 0
    }
}

// [ MARK ] Swipe Gesture
extension DataDetailController{
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc
    func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
}

// [Mark] Data Detail Update Delete Controller Protocol
extension DataDetailController: UpdateDelegate {
    func update(){
        // set Navigation Title
        let title = UILabel()
        title.text = "정보 수정"
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.sizeToFit()
        self.navigationItem.titleView = title
        
        // activate Data TextView
        [self.filterDataTextView, self.totalHardnessTextView, self.alkalinityDataTextView,
         self.phDataTextView, self.memoDataTextView].forEach {
            $0.isEditable = true
        }
        
        // show save Button
        self.saveButton.isHidden = false
        
        // filter Data TextView focus
        filterDataTextView.becomeFirstResponder()
        
        // deactivate Buttons
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.tintColor = .clear
        multifuncButton.isHidden = true
    }
}

// [Mark] Data Detail Share Controller Protocol
extension DataDetailController: ShareDelegate {
    
    func alert(result: String){
        var message = ""
        
        if result != "" {
            message = "데이터 리포트가 PDF파일로 저장되었습니다."
        } else {
            message = "파일 저장에 실패하였습니다."
        }
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
    
    func share(filePath: String) {
        // Create fileURL
        let fileURL = NSURL(fileURLWithPath: filePath)

        // Create the Array which includes the files you want to share
        var filesToShare = [Any]()

        // Add the path of the file to the Array
        filesToShare.append(fileURL)
        
        // Make the activityViewContoller which shows the share-view
        let activityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)

        // Show the share-view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func getTitle() -> String{
        let date = "2022년 8월 31일"
        let time = "10:02 AM"
        let title = "\(date)_\(time)"
        return title
    }
}
