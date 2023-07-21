//
//  Rent.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import Foundation

class Rent: ObservableObject {
    @Published var duration: Int = 0
    @Published var size: String = "Ukuran"
    @Published var price: Int = 0
    @Published var isLocked: Bool = true
    
    @Published private var timestamp: Date = Date.now
    
    var formattedTimestamp: String {
        timestamp.formatted(date: .abbreviated, time: .shortened)
    }
    
    func addDurationToTimestamp() {
        let hoursToAdd = TimeInterval(duration * 3600) // Convert duration to seconds (1 hour = 3600 seconds)
        timestamp = timestamp.addingTimeInterval(hoursToAdd)
    }
    
    func calculatePrice() {
        price = 1000 * duration
    }
    
    init() { }
}
