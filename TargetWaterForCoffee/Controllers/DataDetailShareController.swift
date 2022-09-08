//
//  DataDetailShareController.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/02.
//

protocol ShareDelegate: AnyObject{
    func alert(result: String)
}

import Foundation
import UIKit

class DataDeatilShareController: UIViewController{
    
    let label = UILabel()
    let pdfSaveButton = UIButton(type: .system)
    let pdfShareButton = UIButton(type: .system)
    
    weak var shareDelegate: ShareDelegate?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    let defaultHeight: CGFloat = 207
    
    // Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundUI()
        setupTapGesture()
        setupConstraints()
        setUI()
    }
}

// [ MARK ] Set UI
extension DataDeatilShareController{
    func setBackgroundUI() {
        view.backgroundColor = .clear
    }
    
    func setUI(){
        [label, pdfSaveButton, pdfShareButton].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            pdfSaveButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            pdfSaveButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            pdfSaveButton.widthAnchor.constraint(equalToConstant: 200),
            
            pdfShareButton.topAnchor.constraint(equalTo: pdfSaveButton.bottomAnchor, constant: 20),
            pdfShareButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            pdfShareButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        // label
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
        label.text = "공유하기"
        label.sizeToFit()
        
        // PDF Save Button
        pdfSaveButton.setTitle("PDF 파일로 저장하기", for: .normal)
        pdfSaveButton.titleLabel?.tintColor = .black
        pdfSaveButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        pdfSaveButton.addTarget(self, action: #selector(didTapSaveButton(_:)), for: .touchUpInside)
        
        // PDF Share Button
        pdfShareButton.setTitle("PDF 파일로 내보내기", for: .normal)
        pdfShareButton.titleLabel?.tintColor = .black
        pdfShareButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        pdfShareButton.addTarget(self, action: #selector(didTapShareButton(_:)), for: .touchUpInside)
    }
    
    func setupConstraints() {
        // Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        // Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
}

// [ MARK ] Button Action
extension DataDeatilShareController{
    // Save Button
    @objc
    func didTapSaveButton(_ sender: UIButton){
        self.animateDissmiss()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let dataView = UIApplication.topViewController()!
            self.shareDelegate?.alert(result: UIView.exportAsPdfFromView(dataView.view)())
        }
    }
    
    // Share Button
    @objc
    func didTapShareButton(_ sender: UIButton){
        self.animateDissmiss()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let fileManager = FileManager.default
            let dataView = UIApplication.topViewController()!
            let documentoPath = (self.getDirectoryPath() as NSString).appendingPathComponent(UIView.exportAsPdfFromView(dataView.view)())
            
            if fileManager.fileExists(atPath: documentoPath){
                let documento = NSData(contentsOfFile: documentoPath)
                let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [documento!], applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView=self.view
                self.present(activityViewController, animated: true, completion: nil)
            }
            else {
                print("document was not found")
            }
        }
    }
}

// [ MARK ] Tap Gesture
extension DataDeatilShareController{
    func setupTapGesture(){
        let dimmedViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTap(sender:)))
        dimmedView.addGestureRecognizer(dimmedViewTapGesture)
    }
    @objc func dimmedViewTap(sender: UITapGestureRecognizer) {
        self.animateDissmiss()
    }
}

// [ MARK ] Animation
extension DataDeatilShareController{
    func animateDissmiss(){
        UIView.animate(withDuration : 0.3){
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
        
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration : 0.4){
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}


