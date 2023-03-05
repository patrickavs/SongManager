//
//  ModelInterface.swift
//  SongManager
//
//  Created by Patrick Alves on 04.03.23.
//

import Foundation

class ModelInterface {
    
}

fileprivate class Database: ObservableObject {
    static var sharedInstance = Database()
    
    var data: [Song] = []
}
