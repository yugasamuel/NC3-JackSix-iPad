//
//  RentConfirmationView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI

struct RentConfirmationView: View {
    @EnvironmentObject var navigationManager : NavigationManager
    @ObservedObject var rent: Rent
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressView(firstColor: CustomColor.teal, secondColor: CustomColor.brightYellow, thirdColor: CustomColor.teal)
                .padding(.top, 50)
            
            Spacer()
            
            Text("Konfirmasi penyewaan loker:")
                .font(.system(size: 45))
                .bold()
                .padding(30)
            
            HStack {
                Text("Durasi")
                    .font(.system(size: 35))
                    .padding(.leading, 15)
                Spacer()
                Text("\(rent.duration) jam")
                    .font(.system(size: 35).bold())
                    .padding(.trailing, 15)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 400)
            .background(CustomColor.teal)
            .cornerRadius(10, corners: [.topLeft, .topRight])
            
            HStack {
                Text("Ukuran")
                    .font(.system(size: 35))
                    .padding(.leading, 15)
                Spacer()
                Text("\(rent.size)")
                    .font(.system(size: 35))
                    .padding(.trailing, 15)
                    .bold()
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 400)
            .background(CustomColor.teal)
            
            HStack {
                Text("Aktif Hingga")
                    .font(.system(size: 35))
                    .padding(.leading, 15)
                Spacer()
                Text("\(rent.formattedTimestamp)")
                    .font(.system(size: 35))
                    .padding(.trailing, 15)
                    .bold()
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 400)
            .background(CustomColor.teal)
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
            
            HStack {
                Text("Total Biaya")
                    .font(.system(size: 35))
                    .padding(.leading, 15)
                Spacer()
                Text("Rp\(rent.price)")
                    .font(.system(size: 35))
                    .padding(.trailing, 15)
                    .bold()
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 400)
            .background(CustomColor.teal)
            .cornerRadius(10)
            .padding(30)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    navigationManager.backOnePage()
                }, label: {
                    ButtonView(title: "Kembali")
                })
                Spacer()
                NavigationLink(value: SelectionState.scanning) {
                    ButtonView(title: "Lanjut")
                }
                Spacer()
            }
            .padding(.bottom, 50)
        }
        .presentationDetents([.large])
        .onAppear {
            rent.addDurationToTimestamp()
            rent.calculatePrice()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RentConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        RentConfirmationView(rent: Rent())
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(NavigationManager())
    }
}
