//
//  generateUUID.swift
//  NC3-Jacksix-iPad
//
//  Created by Indah Rahmawati on 23/07/23.
//

import Foundation

//func generateUUID() -> Data {
func generateUUID() -> String {
    
//    let dataQR = Data(UUID().uuidString.utf8)
    let dataQR = String(UUID().uuidString.utf8)
    addToIpadData(UUIDString: dataQR)
    return dataQR
    
}
