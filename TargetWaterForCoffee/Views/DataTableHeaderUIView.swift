//
//  DataTableHeaderUIView.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/09.
//

import UIKit

class DataTableHeaderUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        
        let circleImageView = makeImageView("GraphDataCircles_000")
        lazy var dateLabel = makeLabel("Date")
        lazy var hardnessLabel = makeLabel("Hardness")
        lazy var alkalinityLabel = makeLabel("Alkalinity")
        lazy var phLabel = makeLabel("PH")
        
        [circleImageView, dateLabel, hardnessLabel, alkalinityLabel, phLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let labelWidth = (UIScreen.main.bounds.size.width - 110) / 4
        
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            circleImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20),
            circleImageView.widthAnchor.constraint(equalToConstant: 32),
            circleImageView.heightAnchor.constraint(equalToConstant: 32),
            
            dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 18),
            dateLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            dateLabel.heightAnchor.constraint(equalToConstant: 32),
            
            hardnessLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            hardnessLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            hardnessLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            hardnessLabel.heightAnchor.constraint(equalToConstant: 32),
            
            alkalinityLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            alkalinityLabel.leadingAnchor.constraint(equalTo: hardnessLabel.trailingAnchor, constant: 10),
            alkalinityLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            alkalinityLabel.heightAnchor.constraint(equalToConstant: 32),
            
            phLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            phLabel.leadingAnchor.constraint(equalTo: alkalinityLabel.trailingAnchor, constant: 10),
            phLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            phLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        hardnessLabel.sizeToFit()
        alkalinityLabel.sizeToFit()
    }
    
    private func makeView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
    
    private func makeLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }
    
    private func makeImageView(_ image: String) -> UIImageView{
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}
