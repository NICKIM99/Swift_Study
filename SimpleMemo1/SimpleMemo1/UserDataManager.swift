//
//  UserDataManger.swift
//  SimpleMemo1
//
//  Created by cse on 2020. 2. 4..
//  Copyright © 2020년 cse. All rights reserved.
//

import UIKit

class UserDataManager: NSObject {
    
    static let LIST_KEY_DEFAULT = "default"
    
    static let shared = UserDataManager()
    private override init(){
        super.init()
    }
    
    func saveList(with key:String, list:[TimeInterval] )->Bool{
        UserDefaults.standard.set(list, forKey: key)
        
        return UserDefaults.standard.synchronize()
    }
    
    func getList(with key:String) -> [TimeInterval] {
        if let list = UserDefaults.standard.value(forKey: key) as? [TimeInterval]{
            return list
        }
        return[]
    }
    func getMemo(with timeStampString:String)->String {
        if let memo = UserDefaults.standard.value(forKey: timeStampString) as? String {
            return memo
        }
        
        return ""
    }
    
    func saveMemo(with timeStampStr:String, memo:String)->Bool {
        UserDefaults.standard.set(memo, forKey: timeStampStr)
        return UserDefaults.standard.synchronize()
    }
    
    

}
