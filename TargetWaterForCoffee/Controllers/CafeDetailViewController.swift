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
    
    var dotXAnchor: NSLayoutConstraint?
    var dotYAnchor: NSLayoutConstraint?
    
    let circles = ["GraphDataCircles_111", "GraphDataCircles_111", "GraphDataCircles_101", "GraphDataCircles_100", "GraphDataCircles_100", "GraphDataCircles_110","GraphDataCircles_110"]
    let dates = ["22.08.31", "22.06.20", "22.05.18", "22.04.17", "22.03.18", "22.02.19","22.01.18"]
    let hardnesses = ["60", "65", "65", "52", "52", "50", "50"]
    let alkalinities = ["40", "41", "45", "45", "44", "40", "40"]
    let pHs = ["3", "3", "3", "3", "3", "3", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}


// [ MARK ] Set UI
extension CafeDetailViewController{
    private func setUI(){
        // navigation
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Cafe Name"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add
                                                            , target: self, action: #selector(didTapBarButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .done, target: self, action: #selector(didTapBarButton(_:)))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        [graphImageUIView, graphImageView, graphDrawPointUIView, graphPointImageView, separator1,
         tableHeaderUIView, separator2, tableView].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        dotXAnchor = graphPointImageView.leadingAnchor.constraint(equalTo: graphDrawPointUIView.leadingAnchor, constant: 37)
        dotXAnchor?.isActive = true
        dotYAnchor = graphPointImageView.bottomAnchor.constraint(equalTo: graphDrawPointUIView.bottomAnchor, constant: -40)
        dotYAnchor?.isActive = true
        
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
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
}

extension CafeDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("delegate")
        if tableView.cellForRow(at: indexPath)?.accessoryType == .disclosureIndicator{
            let navVC = UINavigationController(rootViewController: DataDetailController())
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: false)
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator
            NotificationCenter.default.post(name: Notification.Name.callCell, object: nil, userInfo: [NotificationKey.indexPath: indexPath])
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

extension Notification.Name{
    static let callCell = Notification.Name("callCell")
}

enum NotificationKey{
    case indexPath
}

extension CafeDetailViewController: CafeDetailTableViewCellDelegate{
    func getXY(totalHardness: String, Alkalinity: String){
        print("protocol:  \(totalHardness)/\(Alkalinity)")
        let x = Int(0.5 * Double(Alkalinity)!)
        let y = Int(0.8 * Double(totalHardness)!)
        self.dotXAnchor?.constant = CGFloat(x)
        self.dotYAnchor?.constant = CGFloat(y)
    }
}
