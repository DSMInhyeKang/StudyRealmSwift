//
//  ViewController.swift
//  RealmSwiftTest
//
//  Created by 강인혜 on 2022/08/03.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    //Realm 객체 선언
    let realm = try! Realm()
    
    var myUser = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Realm 파일 위치
        // 파일 위치가 달라지면 오류 발생 ➡️ 파일 경로 이동을 위함
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        //delete(멤버 변수 바뀌었을 때)
//        // 아예 Realm 파일 삭제
//        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
//        let realmURLs = [
//            realmURL,
//            realmURL.appendingPathExtension("lock"),
//            realmURL.appendingPathExtension("note"),
//            realmURL.appendingPathExtension("management")
//        ]
//
//        for URL in realmURLs {
//            do {
//                try FileManager.default.removeItem(at: URL)
//            } catch {
//                // handle error
//            }
//        }
        
        
        create()
        read()
        update()
        delete()
        
        
    }
    
    func create() {
        myUser.id = 1
        myUser.age = 17
        myUser.sex = "female"
        myUser.name = "강인혜"
        
        try! realm.write {
            realm.add(myUser)
        }
    }
    
    func read() {
        let users = realm.objects(User.self)
            .filter("sex = 'female'")
            .sorted(byKeyPath: "name", ascending: true)
        
        for user in users {
            print(user.name!)
        }
        
        print("\n\n")
    }
    
    func update() {
        if let user = realm.objects(User.self).first {
            try! realm.write {
                user.age = 16
            }
            
            print(myUser)
            print("\n\n")
        }
    }

    func delete() {
        if let firstItem = realm.objects(User.self)
            .sorted(byKeyPath: "name", ascending: true)
            .first {
            try! realm.write {
                realm.delete(firstItem)
            }
            
            print(myUser)
            print("\n\n")
        }
    }

    

    
    
    

}

