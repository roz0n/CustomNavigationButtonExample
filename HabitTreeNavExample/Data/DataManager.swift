//
//  DataManager.swift
//  HabitTreeNavExample
//
//  Created by Arnaldo Rozon on 4/22/21.
//

import Foundation

struct Tree {
    // CS: There are referred to as "models"
    // Make sure each model has an id property
    var id: Int
    var name: String
    var actions: [Action: Bool]
    var currentStage: Int
    var totalStages: Int
}

struct Action: Hashable {
    var id: Int
}

class DataManager {
    
    // CS: This is referred to as a "singleton", a class that is instatiated only once in the lifecycle of an application
    static let shared = DataManager()
    let store = UserDefaults.standard
    
    // Peep the function arguments, in Swift there are "internal" and "external" function argument names
    func createData(new key: String, of value: [ String: Bool ]) {
        store.setValue(value, forKey: key)
        print("Created new key \(key) of value \(value)!")
    }
    
    func readData(of key: String) -> Any? {
        let data = store.object(forKey: key)
        return data
    }
    
    func updateData() {
        
    }
    
    func deleteData(of key: String) {
        store.removeObject(forKey: key)
        print("Deleted key \(key)!")
    }
    
}
