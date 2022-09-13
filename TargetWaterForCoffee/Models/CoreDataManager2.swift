//
//  CoreDataManager2.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/13.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager2{
    
    // 싱글턴으로 만들기
    static let shared = CoreDataManager2()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 임시저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔터티 이름 (코어데이터에 저장된 객체)
    let modelName: String = "CafeDetail"
    
}

// [ MARK ] Function
extension CoreDataManager2{
    // READ : 코어데이터에 저장된 데이터 모두 읽어오기
    func getCafeDetailFromCoreData() -> [MesureData]{
        
    }
}

