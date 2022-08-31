//
//  CustomDataTableViewCell.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/08.
//

import UIKit

protocol CafeDetailTableViewCellDelegate: AnyObject{
    func getXY(totalHardness: String, Alkalinity: String)
}

class DataTableViewCell: UITableViewCell {

    let circleDataImageView = UIImageView()
    let dateLabel = UILabel()
    let hardnessLabel = UILabel()
    let alkalinityLabel = UILabel()
    let phLabel = UILabel()
//    let clearButton = UIButton()
    
    weak var delegate: CafeDetailTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(circleDataImageView)
        circleDataImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hardnessLabel)
        hardnessLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(alkalinityLabel)
        alkalinityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(phLabel)
        phLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(clearButton)
//        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        circleDataImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6).isActive = true
        circleDataImageView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        circleDataImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        circleDataImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        circleDataImageView.image = UIImage(named: "GraphDataCircles_000")
        circleDataImageView.contentMode = .scaleAspectFit
        
        dateLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: circleDataImageView.trailingAnchor, constant: 14.5).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 71).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        
        hardnessLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6).isActive = true
        hardnessLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 14.5).isActive = true
        hardnessLabel.widthAnchor.constraint(equalToConstant: 71).isActive = true
        hardnessLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        hardnessLabel.textAlignment = .center
        hardnessLabel.font = UIFont.systemFont(ofSize: 14)
        
        alkalinityLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6).isActive = true
        alkalinityLabel.leadingAnchor.constraint(equalTo: hardnessLabel.trailingAnchor, constant: 14.5).isActive = true
        alkalinityLabel.widthAnchor.constraint(equalToConstant: 71).isActive = true
        alkalinityLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        alkalinityLabel.textAlignment = .center
        alkalinityLabel.font = UIFont.systemFont(ofSize: 14)
        
        phLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6).isActive = true
        phLabel.leadingAnchor.constraint(equalTo: alkalinityLabel.trailingAnchor, constant: 14.5).isActive = true
        phLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        phLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        phLabel.textAlignment = .center
        phLabel.font = UIFont.systemFont(ofSize: 14)
        
//        clearButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        clearButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        clearButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
//        clearButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        clearButton.backgroundColor = .clear
//        clearButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        if self.isFocused{
            print("!!!")
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DataTableViewCell{
    @objc
    func didTapButton(_ sender: UIButton){
        print("cell")
        //delegate?.getXY(totalHardness: hardnessLabel.text ?? "", Alkalinity: alkalinityLabel.text ?? "")
    }
}
