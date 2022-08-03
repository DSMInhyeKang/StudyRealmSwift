//
//  User.swift
//  RealmSwiftTest
//
//  Created by 강인혜 on 2022/08/03.
//

import Foundation
import RealmSwift

//객체 데이터 모델
class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var age: Int = 0
    @objc dynamic var sex: String?
    @objc dynamic var name: String?
}
