//
//  array.swift
//  NC3-Jacksix-iPad
//
//  Created by Indah Rahmawati on 23/07/23.
//

import Foundation
import SwiftUI

struct ipadData: Identifiable{
    var id = UUID()
    var UUIDString: String

    init(UUIDString:String) {
        self.UUIDString = UUIDString
        
    }
}

extension ipadData {
    static var sampleData: [ipadData] {
        [
            
        ]

    }
}

func addToIpadData (UUIDString:String) {
    let newUsersData = ipadData(UUIDString: UUIDString)
    ipadDataArray.append(newUsersData)
}
var ipadDataArray = ipadData.sampleData

func removeFromIpadData(UUIDString: String) {
    if let index = ipadDataArray.firstIndex(where: { $0.UUIDString == UUIDString }) {
        ipadDataArray.remove(at: index)
    }
}

//=-----------------------------------
struct history: Identifiable{
    var id = UUID()
    var UUIDStringHistory: String

    init(UUIDStringHistory:String) {
        self.UUIDStringHistory = UUIDStringHistory
        
    }
}

extension history {
    static var sampleData: [history] {
        [
            
        ]

    }
}

func addToHistoryData (UUIDStringHistory:String) {
    let newUsersData = history(UUIDStringHistory: UUIDStringHistory)
    historyArray.append(newUsersData)
}
var historyArray = history.sampleData

