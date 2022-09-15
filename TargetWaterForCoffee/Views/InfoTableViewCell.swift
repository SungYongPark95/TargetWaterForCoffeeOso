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
    let gitLabel = UILabel()
    let gitUrlLabel = UILabel()
    let emailLabel = UILabel()
    let emailAddressLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [personIcon, nameLabel, partLabel, gitLabel, gitUrlLabel, emailLabel, emailAddressLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            personIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            personIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            personIcon.widthAnchor.constraint(equalToConstant: 19),
            personIcon.heightAnchor.constraint(equalToConstant: 19),
            
            nameLabel.leadingAnchor.constraint(equalTo: personIcon.trailingAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: personIcon.centerYAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 36),
            nameLabel.heightAnchor.constraint(equalToConstant: 17),
            
            partLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            partLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor, constant: -5),
            partLabel.widthAnchor.constraint(equalToConstant: 75),
            partLabel.heightAnchor.constraint(equalToConstant: 14),
            
            gitLabel.topAnchor.constraint(equalTo: personIcon.bottomAnchor, constant: 5),
            gitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            gitLabel.widthAnchor.constraint(equalToConstant: 156),
            gitLabel.heightAnchor.constraint(equalToConstant: 16),
            
            gitUrlLabel.centerYAnchor.constraint(equalTo: gitLabel.centerYAnchor),
            gitUrlLabel.leadingAnchor.constraint(equalTo: gitLabel.trailingAnchor),
            gitUrlLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 19),
            gitUrlLabel.heightAnchor.constraint(equalToConstant: 16),
            
            emailLabel.topAnchor.constraint(equalTo: gitUrlLabel.bottomAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            emailLabel.widthAnchor.constraint(equalToConstant: 156),
            emailLabel.heightAnchor.constraint(equalToConstant: 16),
            
            emailAddressLabel.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailAddressLabel.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailAddressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 19),
            emailAddressLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        personIcon.image = UIImage(systemName: "person.fill")
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        partLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        [gitLabel, emailLabel, gitUrlLabel, emailAddressLabel].forEach {
            $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        }
        gitLabel.text = "GitHub |"
        emailLabel.text = "E-mail |"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
