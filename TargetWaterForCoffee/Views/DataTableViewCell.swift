//
//  CustomDataTableViewCell.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/08.
//

import UIKit

protocol CafeDetailTableViewCellDelegate: AnyObject {
    func getXY(alkalinity: String, hardness: String)
}

class DataTableViewCell: UITableViewCell {

    let circleDataImageView = UIImageView()
    let dateLabel = UILabel()
    let hardnessLabel = UILabel()
    let alkalinityLabel = UILabel()
    let phLabel = UILabel()
    
    // cafeDetailData를 전달받을 변수
    var cafeDetailData: CafeDetailData? {
        didSet {
            configureUIwithData()
        }
    }
    
    weak var delegate: CafeDetailTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getXY(notification:)), name: Notification.Name.callCell, object: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// [Mark] Set UI
extension DataTableViewCell {
    private func setUI() {
        [circleDataImageView, dateLabel, hardnessLabel, alkalinityLabel, phLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let labelWidth = (UIScreen.main.bounds.size.width - 110) / 4
        
        NSLayoutConstraint.activate([
            circleDataImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6),
            circleDataImageView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20),
            circleDataImageView.widthAnchor.constraint(equalToConstant: 32),
            circleDataImageView.heightAnchor.constraint(equalToConstant: 32),
            
            dateLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: circleDataImageView.trailingAnchor, constant: 18),
            dateLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            dateLabel.heightAnchor.constraint(equalToConstant: 32),
            
            hardnessLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6),
            hardnessLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            hardnessLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            hardnessLabel.heightAnchor.constraint(equalToConstant: 32),
            
            alkalinityLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6),
            alkalinityLabel.leadingAnchor.constraint(equalTo: hardnessLabel.trailingAnchor, constant: 10),
            alkalinityLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            alkalinityLabel.heightAnchor.constraint(equalToConstant: 32),
            
            phLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 6),
            phLabel.leadingAnchor.constraint(equalTo: alkalinityLabel.trailingAnchor, constant: 10),
            phLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            phLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        circleDataImageView.image = UIImage(named: "GraphDataCircles_000")
        circleDataImageView.contentMode = .scaleAspectFit
        
        [dateLabel, hardnessLabel, alkalinityLabel, phLabel].forEach {
            $0.textAlignment = .center
            $0.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    // 데이터를 적절한 UI로 표시
    func configureUIwithData() {
        circleDataImageView.image = UIImage(named: (cafeDetailData?.circle)!)
        dateLabel.text = cafeDetailDateFormatter(date: (cafeDetailData?.date)!)
        dateLabel.sizeToFit()
        hardnessLabel.text = cafeDetailData?.hardness
        hardnessLabel.sizeToFit()
        alkalinityLabel.text = cafeDetailData?.alkalinity
        alkalinityLabel.sizeToFit()
        phLabel.text = cafeDetailData?.ph
        phLabel.sizeToFit()
    }
}

// [Mark] Cell Protocol Function
extension DataTableViewCell {
    @objc
    func getXY(notification: Notification) {
        let object = notification.object as? Int ?? 0
        if object == tag{
            delegate?.getXY(alkalinity: alkalinityLabel.text ?? "", hardness: hardnessLabel.text ?? "")
        }
    }
}
