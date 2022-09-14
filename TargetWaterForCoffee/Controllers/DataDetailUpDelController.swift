//
//  DataDetailShareController.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/02.
//

import Foundation
import UIKit

protocol UpDelDelegate: AnyObject {
    func update()
    func delete() -> Bool
}

class DataDetailUpDelController: UIViewController {
    
    let editButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)
    
    weak var upDelDelegate: UpDelDelegate?
    
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
    
    let defaultHeight: CGFloat = 161
    
    // Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTapGesture()
        setupConstraints()
        setUI()
    }
}

// [ MARK ] Set UI
extension DataDetailUpDelController {
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setUI(){
        [editButton, deleteButton].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            editButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 200),
            
            deleteButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            deleteButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        // PDF Save Button
        editButton.setTitle("수정하기", for: .normal)
        editButton.titleLabel?.tintColor = .black
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
        
        // PDF Share Button
        deleteButton.setTitle("삭제하기", for: .normal)
        deleteButton.titleLabel?.tintColor = .red
        deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
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

// [ MARK ] Button Function
extension DataDetailUpDelController {
    @objc
    func didTapEditButton(_ sender: UIButton) {
        upDelDelegate?.update()
        self.dismiss(animated: true)
    }
    
    @objc
    func didTapDeleteButton(_ sender: UIButton) {
        let message = "데이터 리포트를 삭제하시겠습니까?"
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default){_ in
            // CoreData
            let deleteResult = self.upDelDelegate?.delete()
            if deleteResult == true {
                // UI
                let resultMessage = "데이터 리포트가 삭제되었습니다."
                let resultAlertController = UIAlertController(title: "", message: resultMessage, preferredStyle: .alert)
                let resultConfirmAction = UIAlertAction(title: "확인", style: .default){ _ in
                    self.dismiss(animated: false)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        let dataView = UIApplication.topViewController()!
                        dataView.dismiss(animated: true)
                    }
                }
                resultAlertController.addAction(resultConfirmAction)
                self.present(resultAlertController, animated: true)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
}

// [ MARK ] Tap Gesture
extension DataDetailUpDelController {
    func setupTapGesture() {
        let dimmedViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTap(sender:)))
        dimmedView.addGestureRecognizer(dimmedViewTapGesture)
    }
    @objc func dimmedViewTap(sender: UITapGestureRecognizer) {
        self.animateDissmiss()
    }
}

// [ MARK ] Animation
extension DataDetailUpDelController {
    func animateDissmiss() {
        UIView.animate(withDuration : 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
        
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration : 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}
