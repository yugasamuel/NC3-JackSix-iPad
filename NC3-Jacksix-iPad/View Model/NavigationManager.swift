//
//  NavigationManager.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 20/07/23.
//

import Foundation

enum SelectionState: Hashable {
    case rentLocker
    case returnItem
    case confirmation
    case scanning
    case rentSuccess
    case returnSuccess
}

class NavigationManager: ObservableObject {
    
    @Published var selectionPath = [SelectionState]()
    @Published var isInfoPresented = false
    
    func popToRoot() {
        selectionPath.removeAll()
    }
    
    func backOnePage() {
        selectionPath.removeLast()
    }
}
