//
//  ContentView.swift
//  NC3-Jacksix-iPad
//
//  Created by Jason Leonardo on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pageModel: PageNavigation
    
    var body: some View {
        VStack {
            if pageModel.pageIndex == 0{
                SelectionView()
            }
            else if pageModel.pageIndex == 1{
                DurationView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("okBlue"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PageNavigation())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
