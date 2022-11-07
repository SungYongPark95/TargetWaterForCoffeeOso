//
//  InfoTableViewCell.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/15.
//

import Foundation
import UIKit

class InfoTableViewCell: UITableViewCell {
    let personIcon = UIImageView()
    let nameLabel = UILabel()
    let partLabel = UILabel()
    let urlLabel = UILabel()
    let urlAddressLabel = UITextView()
    let emailLabel = UILabel()
    let emailAddressLabel = UITextView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// [ MARK ] Set UI
extension InfoTableViewCell {
    private func setUI() {
        self.backgroundColor = .clear
        
        [personIcon, nameLabel, partLabel, urlLabel, urlAddressLabel, emailLabel, emailAddressLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            personIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            personIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            personIcon.widthAnchor.constraint(equalToConstant: 19),
            personIcon.heightAnchor.constraint(equalToConstant: 19),
            
            nameLabel.leadingAnchor.constraint(equalTo: personIcon.trailingAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: personIcon.bottomAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 17),
            
            partLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 2),
            partLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            partLabel.widthAnchor.constraint(equalToConstant: 100),
            partLabel.heightAnchor.constraint(equalToConstant: 14),
            
            urlLabel.topAnchor.constraint(equalTo: personIcon.bottomAnchor, constant: 7),
            urlLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            urlLabel.widthAnchor.constraint(equalToConstant: 100),
            urlLabel.heightAnchor.constraint(equalToConstant: 16),
            
            urlAddressLabel.centerYAnchor.constraint(equalTo: urlLabel.centerYAnchor),
            urlAddressLabel.leadingAnchor.constraint(equalTo: urlLabel.trailingAnchor, constant: 5),
            urlAddressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 19),
            urlAddressLabel.heightAnchor.constraint(equalToConstant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: urlAddressLabel.bottomAnchor, constant: 5),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            emailLabel.widthAnchor.constraint(equalToConstant: 55),
            emailLabel.heightAnchor.constraint(equalToConstant: 16),
            
            emailAddressLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailAddressLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 5),
            emailAddressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 19),
            emailAddressLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        // set data & options
        personIcon.image = UIImage(systemName: "person.fill")
        personIcon.tintColor = UIColor(red: 124, green: 172, blue: 255)
        
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        partLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        partLabel.textColor = .lightGray
        
        [urlLabel, emailLabel].forEach {
            $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            $0.textAlignment = .right
        }
        urlLabel.text = "GitHub |"
        emailLabel.text = "E-mail |"
        
        [urlAddressLabel, emailAddressLabel].forEach {
            $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            $0.backgroundColor = .clear
            $0.textContainerInset = .zero
            $0.isEditable = false
            $0.dataDetectorTypes = .link
        }
    }
}
