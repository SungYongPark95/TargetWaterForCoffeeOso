//
//  AddDataTableViewCell.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/08.
//

import UIKit

protocol AddDataTableViewCellDelegate: AnyObject{
    func setData(data: String, tag: Int)
}

class AddDataTableViewCell: UITableViewCell{
    
    let dataTypeLabel = UILabel()
    let textField = UITextField()
    
    weak var delegate: AddDataTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// [MARK] Set UI
extension AddDataTableViewCell{
    func setUI(){
        [dataTypeLabel, textField].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            dataTypeLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 16),
            dataTypeLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            dataTypeLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            dataTypeLabel.widthAnchor.constraint(equalToConstant: 110),
            
            textField.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: dataTypeLabel.trailingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        dataTypeLabel.font = UIFont.boldSystemFont(ofSize: 15)
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.keyboardType = .numberPad
        textField.textAlignment = .right
        textField.tintColor = .clear
        textField.delegate = self
    }
}

// [MARK] Delegate Pattern
extension AddDataTableViewCell: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let textData = textField.text else { print("error"); return}
        delegate?.setData(data: textData, tag: tag) ?? print("Error")
    }
}
