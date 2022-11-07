//
//  CreaterInfoUIView.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/15.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    let mainLabel = UILabel()
    let subLabel = UILabel()
    let imageView = UIImageView()
    let personInfoUIView = UIView()
    let personInfoTitleLabel = UILabel()
    let personInfoTableView = UITableView()
    let versionLabel = UILabel()
    
    let posision = ["iOS Developer", "UX/UI Designer"]
    let personData = [["김현준",
                       "iOS Developer",
                       "https://github.com/Hyeon-Jun-Kim",
                       "holden.developer@gmail.com"],
                      ["박성용",
                       "iOS Developer",
                       "https://github.com/SungYongPark95",
                       "sungyong.park6@gmail.com"],
                      ["장인희",
                       "UX/UI Designer",
                       "https://www.behance.net/innissi/moodboards",
                       "inheejang7@gmail.com"]]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension InfoViewController {
    private func setUI() {
        [mainLabel, subLabel, imageView, personInfoUIView, personInfoTitleLabel, personInfoTableView,
         versionLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor),
            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 60),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 220),
            imageView.heightAnchor.constraint(equalToConstant: 133),
            
            personInfoUIView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            personInfoUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personInfoUIView.widthAnchor.constraint(equalToConstant: 315),
            personInfoUIView.heightAnchor.constraint(equalToConstant: 330),
            
            personInfoTitleLabel.topAnchor.constraint(equalTo: personInfoUIView.topAnchor, constant: 25),
            personInfoTitleLabel.leadingAnchor.constraint(equalTo: personInfoUIView.leadingAnchor, constant: 25),
            personInfoTitleLabel.widthAnchor.constraint(equalToConstant: 140),
            personInfoTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            personInfoTableView.topAnchor.constraint(equalTo: personInfoTitleLabel.bottomAnchor, constant: 20),
            personInfoTableView.leadingAnchor.constraint(equalTo: personInfoTitleLabel.leadingAnchor),
            personInfoTableView.widthAnchor.constraint(equalToConstant: 250),
            personInfoTableView.heightAnchor.constraint(equalToConstant: 235),
            
            versionLabel.topAnchor.constraint(equalTo: personInfoUIView.bottomAnchor, constant: 5),
            versionLabel.trailingAnchor.constraint(equalTo: personInfoUIView.trailingAnchor)
        ])
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        navigationController?.isNavigationBarHidden = true
        
        mainLabel.text = "Water For Coffee"
        mainLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        mainLabel.textColor = .darkGray
        
        subLabel.text = "Better water for better Coffee."
        subLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subLabel.textColor = .gray
        
        imageView.image = UIImage(named: "InfoIogo")
        
        personInfoUIView.backgroundColor = UIColor(red: 242, green: 248, blue: 255)
        personInfoUIView.layer.cornerRadius = 20
        
        personInfoTitleLabel.text = "Who made This?"
        personInfoTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        personInfoTitleLabel.textColor = .darkGray
        
        personInfoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "Cell")
        personInfoTableView.rowHeight = 85
        personInfoTableView.isScrollEnabled = false
        personInfoTableView.dataSource = self
        personInfoTableView.separatorStyle = .none
        personInfoTableView.backgroundColor = .clear
        
        versionLabel.text = "version 1.0"
        versionLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        versionLabel.textColor = .lightGray
    }
}

extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? InfoTableViewCell else {fatalError()}
        
        // Row 데이터 타입 삽입
        cell.nameLabel.text = personData[indexPath.row][0]
        cell.partLabel.text = personData[indexPath.row][1]
        cell.urlAddressLabel.text = personData[indexPath.row][2]
        cell.emailAddressLabel.text = personData[indexPath.row][3]
        if cell.partLabel.text != "iOS Developer" {
            cell.urlLabel.text = "Portfolio |"
        }
        
        // 셀 선택 이벤트 제거
        cell.selectionStyle = .none
        return cell
    }
}
