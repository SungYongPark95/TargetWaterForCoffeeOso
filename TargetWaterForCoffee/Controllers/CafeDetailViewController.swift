//
//  ViewController.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/04.
//

import UIKit

class CafeDetailViewController: UIViewController {
    
    let graphImageUIView = UIView()
    let graphImageView = UIImageView()
    let graphDrawPointUIview = UIView()
    let graphDotImage = UIImage()
    let separator1 = UILabel()
    let tableHeaderUIView = DataTableHeaderUIView()
    let separator2 = UILabel()
    let tableView = UITableView()
    
    let circles = ["GraphDataCircles_000", "GraphDataCircles_100", "GraphDataCircles_010", "GraphDataCircles_101", "GraphDataCircles_110", "GraphDataCircles_111","GraphDataCircles_000", "GraphDataCircles_100", "GraphDataCircles_010", "GraphDataCircles_101", "GraphDataCircles_110", "GraphDataCircles_111"]
    let dates = ["00.00.00", "00.00.00", "00.00.00", "00.00.00", "00.00.00", "00.00.00","00.00.00", "00.00.00", "00.00.00", "00.00.00", "00.00.00", "00.00.00"]
    let hardnesses = ["0", "0", "0", "0", "0", "0","0", "0", "0", "0", "0", "0"]
    let alkalinities = ["0", "0", "0", "0", "0", "0","0", "0", "0", "0", "0", "0"]
    let pHs = ["0", "0", "0", "0", "0", "0","0", "0", "0", "0", "0", "0"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [ navigation ]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Cafe Name"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add
                                                            , target: self, action: #selector(didTapBarButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.addSubview(graphImageUIView)
        view.addSubview(graphImageView)
        view.addSubview(graphDrawPointUIview)
        view.addSubview(separator1)
        view.addSubview(tableHeaderUIView)
        view.addSubview(separator2)
        view.addSubview(tableView)
        
        graphImageUIView.translatesAutoresizingMaskIntoConstraints = false
        graphDrawPointUIview.translatesAutoresizingMaskIntoConstraints = false
        graphImageView.translatesAutoresizingMaskIntoConstraints = false
        separator1.translatesAutoresizingMaskIntoConstraints = false
        tableHeaderUIView.translatesAutoresizingMaskIntoConstraints = false
        separator2.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // [ graph ]
        graphImageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        graphImageUIView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        graphImageUIView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        graphImageUIView.heightAnchor.constraint(equalToConstant: 325).isActive = true
        graphImageUIView.backgroundColor = .white
        
        let image = UIImage(named: "WaterGraph")
        graphImageView.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 27).isActive = true
        graphImageView.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 12).isActive = true
        graphImageView.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -11).isActive = true
        graphImageView.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -20).isActive = true
        graphImageView.image = image
        
        graphDrawPointUIview.backgroundColor = .clear
        graphDrawPointUIview.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 39).isActive = true
        graphDrawPointUIview.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 67).isActive = true
        graphDrawPointUIview.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -27).isActive = true
        graphDrawPointUIview.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -64).isActive = true
        
        // [separator1]
        separator1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        separator1.topAnchor.constraint(equalTo: graphImageUIView.bottomAnchor).isActive = true
        separator1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        separator1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        separator1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        // [ tableHeaderUIView ]
        tableHeaderUIView.topAnchor.constraint(equalTo: separator1.bottomAnchor).isActive = true
        tableHeaderUIView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableHeaderUIView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableHeaderUIView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tableHeaderUIView.backgroundColor = .white
        
        // [separator2]
        separator2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        separator2.topAnchor.constraint(equalTo: tableHeaderUIView.bottomAnchor).isActive = true
        separator2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        separator2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        separator2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        // [ tableView ]
        tableView.topAnchor.constraint(equalTo: separator2.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10).isActive = true
        tableView.backgroundColor = .white
        tableView.separatorInset.left = 0
        // 셀 등록 및 데이터 삽입
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self

    }
    
    @objc
    func didTapBarButton(_ sender: UIBarButtonItem){
        if sender == navigationItem.rightBarButtonItem{
            let navVC = UINavigationController(rootViewController: AddDataViewController())
            present(navVC, animated: true)
        } else{
            // navigation left button click event
        }
    }

}

// 테스트 데이터를 사용하여 데이터 테이블에 셀 생성
extension CafeDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                as? DataTableViewCell else{ fatalError() }
        cell.circleDataImageView.image = UIImage(named: circles[indexPath.row])
        cell.dateLabel.text = dates[indexPath.row]
        cell.dateLabel.sizeToFit()
        cell.hardnessLabel.text = hardnesses[indexPath.row]
        cell.hardnessLabel.sizeToFit()
        cell.alkalinityLabel.text = alkalinities[indexPath.row]
        cell.alkalinityLabel.sizeToFit()
        cell.phLabel.text = pHs[indexPath.row]
        cell.phLabel.sizeToFit()
        return cell
    }
    
    
}

