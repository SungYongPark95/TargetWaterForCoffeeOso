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
    let memoTextField = UITextField()
    let saveButton = UIButton()
    let dataTypes = ["Total Hardness", "Alkalinity", "PH", "Filter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.97, alpha: 1)
        navigationItem.title = "데이터 입력하기"
        
        view.addSubview(tableView)
        view.addSubview(memoLabel)
        view.addSubview(memoTextField)
        view.addSubview(saveButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        memoLabel.translatesAutoresizingMaskIntoConstraints = false
        memoTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor , constant: 82),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 200),
            
            memoLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 28),
            memoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            memoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -313),
            
            memoTextField.topAnchor.constraint(equalTo: memoLabel.bottomAnchor, constant: 5),
            memoTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            memoTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            memoTextField.heightAnchor.constraint(equalToConstant: 93),
            
            saveButton.topAnchor.constraint(equalTo: memoTextField.bottomAnchor, constant: 28),
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
        
        // [ Memo TextField]
        memoTextField.backgroundColor = .white
        memoTextField.layer.cornerRadius = 10
        memoTextField.font = UIFont.systemFont(ofSize: 14)
//        memoTextField.text = textViewPlaceHolder
        memoTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        memoTextField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        memoTextField.rightViewMode = .always
        memoTextField.leftViewMode = .always
        memoTextField.keyboardType = .decimalPad
        
        // [ Save Button ]
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("저장하기", for: .normal)
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

