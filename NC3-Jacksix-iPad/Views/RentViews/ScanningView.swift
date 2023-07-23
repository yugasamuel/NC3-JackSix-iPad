//
//  ScanningView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI

struct ScanningView: View {
    @EnvironmentObject var navigationManager : NavigationManager
    var body: some View {
        VStack(spacing: 0) {
            ProgressView(firstColor: CustomColor.teal, secondColor: CustomColor.teal, thirdColor: CustomColor.brightYellow)
                .padding(.top, 50)
            
            Spacer()
            
            Text("Silahkan pindai kode QR di bawah untuk melakukan pembayaran:")
                .font(.system(size: 45)                .bold())
                .multilineTextAlignment(.center)
                .frame(width: 850)
                .padding(30)
            
            NavigationLink(value: SelectionState.rentSuccess) {
//                Image("QR")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 300, height: 300)
            }
            QRGeneratorView()
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    navigationManager.backOnePage()
                }, label: {
                    ButtonView(title: "Kembali")
                })
                Spacer()
                Button(action: {
                    navigationManager.popToRoot()
                }, label: {
                    ButtonView(title: "Selesai")
                })
                Spacer()
            }
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
