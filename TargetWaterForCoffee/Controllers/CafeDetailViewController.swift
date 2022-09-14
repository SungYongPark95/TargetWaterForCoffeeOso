//
//  ViewController.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/04.
//

import UIKit
import CoreData

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
    
    let coreDataManager = CoreDataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tableView.cellForRow(at: [0,1])?.select(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}


// [ MARK ] Set UI
extension CafeDetailViewController {
    private func setUI() {
        // navigation - Title
        navigationController?.navigationBar.tintColor = .white
        let mainTitle = UILabel()
        mainTitle.text = "Water For Coffee"
        mainTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        mainTitle.sizeToFit()
        navigationItem.titleView = mainTitle
        // navigation - Bar Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapBarButton(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapBarButton(_:)))
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "LOGO")
        navigationItem.leftBarButtonItem?.customView = logoImageView
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        // Add & set Views
        [graphImageUIView, graphImageView, graphDrawPointUIView, graphPointImageView, separator1,
         tableHeaderUIView, separator2, tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        dotXAnchor = graphPointImageView.centerXAnchor.constraint(equalTo: graphDrawPointUIView.leadingAnchor, constant: 285)
        dotXAnchor?.isActive = true
        dotYAnchor = graphPointImageView.centerYAnchor.constraint(equalTo: graphDrawPointUIView.bottomAnchor, constant: -221)
        dotYAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            // graph - UIView
            graphImageUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            graphImageUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            graphImageUIView.widthAnchor.constraint(equalToConstant: 380),
            graphImageUIView.heightAnchor.constraint(equalToConstant: 320),
            
            // graph - ImageView
            graphImageView.centerXAnchor.constraint(equalTo:graphImageUIView.centerXAnchor),
            graphImageView.centerYAnchor.constraint(equalTo: graphImageUIView.centerYAnchor),
            graphImageView.widthAnchor.constraint(equalToConstant: 352),
            graphImageView.heightAnchor.constraint(equalToConstant: 288),
            
            // graph - pointUIView
            graphDrawPointUIView.topAnchor.constraint(equalTo: graphImageUIView.topAnchor, constant: 28),
            graphDrawPointUIView.leadingAnchor.constraint(equalTo: graphImageUIView.leadingAnchor, constant: 66),
            graphDrawPointUIView.trailingAnchor.constraint(equalTo: graphImageUIView.trailingAnchor, constant: -29),
            graphDrawPointUIView.bottomAnchor.constraint(equalTo: graphImageUIView.bottomAnchor, constant: -61),
            
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
    
    func setTableView() {
        
    }
}

// [ Mark ] function
extension CafeDetailViewController {
    @objc
    func didTapBarButton(_ sender: UIBarButtonItem) {
        if sender == navigationItem.rightBarButtonItem{
            let addDataViewController = AddDataViewController()
            addDataViewController.delegate = self
            let navVC = UINavigationController(rootViewController: addDataViewController)
            present(navVC, animated: true)
        } else {
            // navigation left button click event
            print("left")
        }
    }
}

// [ Mark ] 테스트 데이터를 사용하여 데이터 테이블에 셀 생성
extension CafeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if coreDataManager.getCafeDetailListFromCoreData().count == 0 {
            coreDataManager.saveCafeDetailData(hardness: "70", alkalinity: "40", ph: "3", circle: circles(hardness: 70, alkalinity: 40), filter: "Claris Prime", memo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.") {
                print("Create Defalt Data")
            }
        }
        return coreDataManager.getCafeDetailListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DataTableViewCell
        let cafeDetailData = coreDataManager.getCafeDetailListFromCoreData()
        cell.cafeDetailData = cafeDetailData[indexPath.row]
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
}

extension CafeDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .disclosureIndicator {
            let dataDetailController = DataDetailController()
            dataDetailController.cafeDetailData = coreDataManager.getCafeDetailListFromCoreData()[indexPath.row]
            let navVC = UINavigationController(rootViewController: dataDetailController)
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .crossDissolve
            present(navVC, animated: true)
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator
            NotificationCenter.default.post(name: Notification.Name.callCell, object: indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

// [Mark] Notification Center Name
extension Notification.Name {
    static let callCell = Notification.Name("callCell")
}

// [Mark] Cell Delegate Protocol
extension CafeDetailViewController: CafeDetailTableViewCellDelegate {
    func getXY(alkalinity: String, hardness: String){
        let x = (285 / 120) * (Double(alkalinity) ?? 0)
        let y = (-221 / 200) * (Double(hardness) ?? 0)
        self.dotXAnchor?.constant = CGFloat(x)
        self.dotYAnchor?.constant = CGFloat(y)
    }
}

// [MARK] After Add Data Protocol
extension CafeDetailViewController: CafeDetailTableReloadDelegate {
    func reloadTable() {
        print("delegate reload")
        tableView.reloadData()
    }
}
