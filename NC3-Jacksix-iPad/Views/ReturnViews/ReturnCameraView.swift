//
//  ReturnCameraView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI

struct ReturnCameraView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("Arahkan kode QR ke pemindai:")
                .font(.system(size: 45).bold())
                .multilineTextAlignment(.center)
                .frame(width: 850)
                .padding(30)
            
            Rectangle()
                .frame(width: 250, height: 250)
                .padding()
            
            Button(action: {
                navigationManager.backOnePage()
            }, label: {
                ButtonView(title: "Kembali")
            })
            .padding(50)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ReturnCameraView_Previews: PreviewProvider {
    static var previews: some View {
        ReturnCameraView()
            .environmentObject(NavigationManager())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
