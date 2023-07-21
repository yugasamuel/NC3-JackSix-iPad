//
//  ReturnSuccessView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI

struct ReturnSuccessView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Text("Loker berhasil dibuka!")
                .font(.system(size: 45).bold())
                .multilineTextAlignment(.center)
                .frame(width: 850)
                .padding(50)
            
            Image(systemName: "checkmark.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .foregroundColor(CustomColor.darkBlue)
                .padding(.vertical)
            
            Text("Terima kasih karena telah menggunakan OKLock!")
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
                .frame(width: 850)
                .padding()
            
            Button(action: {
                navigationManager.popToRoot()
            }, label: {
                Text("OK")
                    .foregroundColor(CustomColor.darkBlue)
                    .font(.title.bold())
                    .padding()
                    .frame(width: 400)
                    .background(CustomColor.brightYellow)
                    .cornerRadius(8)
                    .shadow(radius: 3, x: 0, y: 3)
            })
            .padding(50)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ReturnSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ReturnSuccessView()
            .environmentObject(NavigationManager())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
