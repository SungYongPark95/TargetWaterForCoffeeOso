//
//  MainListView.swift
//  TargetWaterForCoffee
//
//  Created by Sung Yong Park on 2022/07/17.
//

import UIKit
import SnapKit

/// Massive View Controller를 방지하고 View를 분리하기 위함으로 만들어 졌습니다
class MainListView : UIView {
    public let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = UIColor.black.withAlphaComponent(1.0)
        searchBar.placeholder = "매장을 검색하세요"
        searchBar.backgroundColor = UIColor.clear
        searchBar.barTintColor = UIColor.clear
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        searchBar.showsCancelButton = false
        searchBar.showsBookmarkButton = false
        //왼쪽 서치아이콘 이미지 세팅하기
        searchBar.setImage(UIImage(named: "icSearchNonW"), for: UISearchBar.Icon.search, state: .normal)
        //오른쪽 x버튼 이미지 세팅하기
        searchBar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        searchBar.sizeToFit()
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 0
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
        self.setSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        self.backgroundColor = UIColor.systemGray6
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
            make.top.equalTo(self).offset(32)
        }
        searchBar.layer.shadowColor = UIColor.lightGray.cgColor
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        searchBar.layer.shadowOpacity = 0.7
        searchBar.layer.shadowRadius = 4.0
    }
    
    func setSearchBar(){
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            //서치바 텍스트입력시 색 정하기
            textfield.textColor = UIColor.black
            //왼쪽 아이콘 이미지넣기
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                //이미지 틴트컬러 정하기
                leftView.tintColor = UIColor.gray
            }
            //오른쪽 x버튼 이미지넣기
            if let rightView = textfield.rightView as? UIImageView {
                rightView.image = rightView.image?.withRenderingMode(.alwaysTemplate)
                //이미지 틴트 정하기
                rightView.tintColor = UIColor.lightGray
            }
        }
    }
}
