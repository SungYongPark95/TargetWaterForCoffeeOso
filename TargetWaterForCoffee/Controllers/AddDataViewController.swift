//
//  AddDataViewController.swift
//  WaterForCoffee_Store
//
//  Created by 김현준 on 2022/08/05.
//

import UIKit

class AddDataViewController: UIViewController {

    let tableView = UITableView()
    let memoLabel = UILabel()
    let memoTextView = UITextView()
    let saveButton = UIButton(type: .system)
    let dataTypes = ["Total Hardness", "Alkalinity", "PH", "Filter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.97, alpha: 1)
        navigationItem.title = "데이터 입력하기"
        
        view.addSubview(tableView)
        view.addSubview(memoLabel)
        view.addSubview(memoTextView)
        view.addSubview(saveButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        memoLabel.translatesAutoresizingMaskIntoConstraints = false
        memoTextView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor , constant: 82),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 200),
            
            memoLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 28),
            memoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            memoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -313),
            
            memoTextView.topAnchor.constraint(equalTo: memoLabel.bottomAnchor, constant: 5),
            memoTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            memoTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            memoTextView.heightAnchor.constraint(equalToConstant: 93),
            
            saveButton.topAnchor.constraint(equalTo: memoTextView.bottomAnchor, constant: 28),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -227),
            saveButton.heightAnchor.constraint(equalToConstant: 49)
            ])
        
        // [ Table View ]
        tableView.register(AddDataTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.layer.cornerRadius = 10
        tableView.separatorInset.left = 20
        tableView.separatorInset.right = 20
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        // [ Memo Label ]
        memoLabel.text = "Memo"
        
        // [ Memo TextView]
        memoTextView.backgroundColor = .white
        memoTextView.layer.cornerRadius = 10
        memoTextView.font = UIFont.systemFont(ofSize: 14)
        memoTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        memoTextView.keyboardType = .decimalPad
        
        // [ Save Button ]
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("저장하기", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        saveButton.layer.cornerRadius = 10
        
    }
    
    @objc
    func didTapSaveButton(_ sender: UIButton){
        
    }
}

extension AddDataViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AddDataTableViewCell else {fatalError()}
        
        // Row 데이터 타입 삽입
        cell.dataTypeLabel.text = dataTypes[indexPath.row]
        // 데이터 타입이 필터일 경우 텍스트 입력 키보드 활성화
        if cell.dataTypeLabel.text == "Filter"{
            cell.textField.keyboardType = .asciiCapable
        }
        // 셀 선택 이벤트 제거
        cell.selectionStyle = .none
        return cell
    }
}


extension AddDataViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}

