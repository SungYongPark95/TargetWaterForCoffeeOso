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
        
        addSubview(circleImageView)
        addSubview(dateLabel)
        addSubview(hardnessLabel)
        addSubview(alkalinityLabel)
        addSubview(phLabel)
         
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        hardnessLabel.translatesAutoresizingMaskIntoConstraints = false
        alkalinityLabel.translatesAutoresizingMaskIntoConstraints = false
        phLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            circleImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20),
            circleImageView.widthAnchor.constraint(equalToConstant: 32),
            circleImageView.heightAnchor.constraint(equalToConstant: 32),
            
            dateLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 14.5),
            dateLabel.widthAnchor.constraint(equalToConstant: 71),
            dateLabel.heightAnchor.constraint(equalToConstant: 32),
            
            hardnessLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            hardnessLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 14.5),
            hardnessLabel.widthAnchor.constraint(equalToConstant: 71),
            hardnessLabel.heightAnchor.constraint(equalToConstant: 32),
            
            alkalinityLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            alkalinityLabel.leadingAnchor.constraint(equalTo: hardnessLabel.trailingAnchor, constant: 14.5),
            alkalinityLabel.widthAnchor.constraint(equalToConstant: 71),
            alkalinityLabel.heightAnchor.constraint(equalToConstant: 32),
            
            phLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 8),
            phLabel.leadingAnchor.constraint(equalTo: alkalinityLabel.trailingAnchor, constant: 14.5),
            phLabel.widthAnchor.constraint(equalToConstant: 40),
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
