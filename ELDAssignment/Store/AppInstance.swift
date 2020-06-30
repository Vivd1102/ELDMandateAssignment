//
//  AppInstance.swift
// Use this class for storing shared instances

import Foundation

class AppInstance: NSObject {
   
    static let shared = AppInstance()
    var base:Base?
    var categories:[Categories]?
    var product:[Products]?
    var ranking:[Rankings]?
    var tax:Tax?
    var varient:Variants?
    
    override init() {
        super.init()
 
    }
    func saveObject(_ obj: Dictionary<String,Any>, key: NSString){
        UserDefaults.standard.set(obj, forKey: key as String)
        UserDefaults.standard.synchronize()
    }
    func retriveObjectForKey(_ key: NSString) -> AnyObject{
        return (((UserDefaults.standard.object(forKey: key as String)) as AnyObject))
    }
    
}
