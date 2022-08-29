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
    let graphDrawPointUIView = UIView()
    let graphPointImageView = UIImageView()
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
        setUI()
    }
}


// [ MARK ] Set UI
extension CafeDetailViewController{
    func setUI(){
        // navigation
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Cafe Name"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add
                                                            , target: self, action: #selector(didTapBarButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        view.addSubview(graphImageUIView)
        view.addSubview(graphImageView)
        view.addSubview(graphDrawPointUIView)
        view.addSubview(graphPointImageView)
        view.addSubview(separator1)
        view.addSubview(tableHeaderUIView)
        view.addSubview(separator2)
        view.addSubview(tableView)
        
        graphImageUIView.translatesAutoresizingMaskIntoConstraints = false
        graphImageView.translatesAutoresizingMaskIntoConstraints = false
        graphDrawPointUIView.translatesAutoresizingMaskIntoConstraints = false
        graphPointImageView.translatesAutoresizingMaskIntoConstraints = false
        separator1.translatesAutoresizingMaskIntoConstraints = false
        tableHeaderUIView.translatesAutoresizingMaskIntoConstraints = false
        separator2.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            // graph
            graphImageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            graphImageUIView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            graphImageUIView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            graphImageUIView.heightAnchor.constraint(equalToConstant: 325),
            
            graphImageView.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 27),
            graphImageView.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 12),
            graphImageView.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -11),
            graphImageView.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -20),
            
            // graph - pointUIView
            graphDrawPointUIView.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 39),
            graphDrawPointUIView.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 67),
            graphDrawPointUIView.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -27),
            graphDrawPointUIView.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -64),
            
            // graph - pointImageView
            graphPointImageView.bottomAnchor.constraint(equalTo: graphDrawPointUIView.bottomAnchor, constant: -40),
            graphPointImageView.leadingAnchor.constraint(equalTo: graphDrawPointUIView.leadingAnchor, constant: 37),
            
            // separator1
            separator1.topAnchor.constraint(equalTo: graphImageUIView.bottomAnchor),
            separator1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            separator1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            separator1.heightAnchor.constraint(equalToConstant: 2),
            
            // tableHeaderUIView
            tableHeaderUIView.topAnchor.constraint(equalTo: separator1.bottomAnchor),
            tableHeaderUIView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableHeaderUIView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableHeaderUIView.heightAnchor.constraint(equalToConstant: 50),
            
            // separator2
            separator2.topAnchor.constraint(equalTo: tableHeaderUIView.bottomAnchor),
            separator2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            separator2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            separator2.heightAnchor.constraint(equalToConstant: 2),
            
            // tableView
            tableView.topAnchor.constraint(equalTo: separator2.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10)
        ])
        
        graphImageUIView.backgroundColor = .white
        
        let graphImage = UIImage(named: "WaterGraph")
        graphImageView.image = graphImage
        
        graphDrawPointUIView.backgroundColor = .clear
        
        let pointImage = UIImage(named: "GraphDotPointer")
        graphPointImageView.image = pointImage
        
        separator1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        tableHeaderUIView.backgroundColor = .white
        separator2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        tableView.backgroundColor = .white
        tableView.separatorInset.left = 0
        tableView.delegate = self
        
        // 셀 등록 및 데이터 삽입
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
    }
}

// [ Mark ] function
extension CafeDetailViewController{
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

// [ Mark ] 테스트 데이터를 사용하여 데이터 테이블에 셀 생성
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

extension CafeDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
