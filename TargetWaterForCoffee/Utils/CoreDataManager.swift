//
//  CoreDataManager2.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/13.
//

import Foundation
import UIKit
import CoreData

final class CoreDataManager {
    
    // 싱글턴으로 만들기
    static let shared = CoreDataManager()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 임시저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔터티 이름 (코어데이터에 저장된 객체)
    let modelName: String = "CafeDetailData"
    
}

// [ MARK ] Function
extension CoreDataManager {
    // Read : 코어데이터에 저장된 데이터 모두 읽어오기
    func getCafeDetailListFromCoreData() -> [CafeDetailData] {
        var cafeDetailList: [CafeDetailData] = []
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 정렬순서를 정해서 요청서에 넘겨주기
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do {
                // 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
                if let fetchedCafeDetailList = try context.fetch(request) as? [CafeDetailData] {
                    cafeDetailList = fetchedCafeDetailList
                }
            } catch {
                print("데이터 가져오기 실패")
            }
        }
        
        return cafeDetailList
    }
    
    // Create : 코어데이터에 데이터 생성하기
    func saveCafeDetailData(hardness: String?, alkalinity: String?, ph: String?, circle: String?,
                            filter: String?, memo: String?, completion: @escaping () -> Void) {
        // 임시저장소 있는지 확인
        if let context = context {
            // 임시저장소에 있는 데이터를 그려줄 형태 파악하기
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                
                // 임시저장소에 올라가게 할 객체만들기 (NSManagedObject ===> ToDoData)
                if let cafeDetailData = NSManagedObject(entity: entity, insertInto: context) as? CafeDetailData {
                    
                    // CafeDetailData에 실제 데이터 할당
                    cafeDetailData.date = Date()
                    cafeDetailData.hardness = hardness
                    cafeDetailData.alkalinity = alkalinity
                    cafeDetailData.ph = ph
                    cafeDetailData.filter = filter
                    cafeDetailData.memo = memo
                    cafeDetailData.circle = circle
                    appDelegate?.saveContext()
                }
            }
        }
        completion()
    }
    
    // Delete : 코어데이터에서 데이터 삭제 (일치하는 데이터 찾아서 삭제)
    func deleteCafeDetailData(data: CafeDetailData, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let date = data.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [CafeDetailData] {
                    
                    // 임시저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete메서드)
                    if let targetCafeDetail = fetchedToDoList.first {
                        context.delete(targetCafeDetail)
                        
                        appDelegate?.saveContext()
                    }
                }
                completion()
            } catch {
                print("데이터 삭제 실패")
                completion()
            }
        }
    }
    
    // Update : 코어데이터에서 일치하는 데이터를 찾아 수정
    func updateToDo(newCafeDetailData: CafeDetailData, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let date = newCafeDetailData.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기
                if let fetchedCafeDetailList = try context.fetch(request) as? [CafeDetailData] {
                    // 배열의 첫번째
                    if var targetCafeDetail = fetchedCafeDetailList.first {
                        
                        // CafeDetailData에 실제 데이터 재할당
                        targetCafeDetail = newCafeDetailData
                        
                        appDelegate?.saveContext()
                    }
                }
                completion()
            } catch {
                print("데이터 업데이트 실패")
                completion()
            }
        }
    }
    
    
}

