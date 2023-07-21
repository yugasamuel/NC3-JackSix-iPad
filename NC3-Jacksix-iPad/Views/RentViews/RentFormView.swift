//
//  RentFormView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI

struct RentFormView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject var rent: Rent
    let durationList = Array(0...48)
    let sizeList = ["Ukuran", "Kecil", "Sedang" ,"Besar"]
    
    var disableForm: Bool {
        rent.duration == 0 || rent.size == "Ukuran"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ProgressView(firstColor: CustomColor.brightYellow, secondColor: CustomColor.teal, thirdColor: CustomColor.teal)
                .padding(.top, 50)
            
            Spacer()
            
            Text("Tentukan durasi dan ukuran loker: ")
                .font(.system(size: 45))
                .bold()
                .padding(30)
            
            HStack {
                Text("Durasi")
                    .font(.system(size: 35))
                    .padding(.leading, 15)
                Spacer()
                Picker("Durasi", selection: $rent.duration) {
                    ForEach(durationList, id: \.self) { duration in
                        Text("\(duration) Jam")
                    }
                }
                .scaleEffect(2)
                .padding(.trailing, 30)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 400)
            .background(CustomColor.teal)
            
            HStack {
                Text("Ukuran")
                    .font(.system(size: 35))
                    .padding(.leading, 15)
                Spacer()
                Picker("Ukuran", selection: $rent.size) {
                    ForEach(sizeList, id: \.self) { size in
                        Text(size)
                    }
                }
                .scaleEffect(2)
                .padding(.trailing, 35)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 400)
            .background(CustomColor.teal)
            
            Button(action: {
                navigationManager.isInfoPresented = true
            }, label: {
                HStack(alignment: .center) {
                    Text("Panduan ukuran loker")
                        .font(.system(size: 25))
                        .padding(.vertical)
                    Image(systemName: "info.circle")
                        .font(.title2)
                }
            })
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    navigationManager.backOnePage()
                }, label: {
                    ButtonView(title: "Kembali")
                })
                Spacer()
                NavigationLink(value: SelectionState.confirmation) {
                    ButtonView(title: "Lanjut")
                }
                .disabled(disableForm)
                Spacer()
            }
            .padding(.bottom, 50)
        }
        .foregroundColor(CustomColor.darkBlue)
        .navigationBarBackButtonHidden(true)
    }
}

struct RentFormView_Previews: PreviewProvider {
    static var previews: some View {
        RentFormView(rent: Rent())
            .environmentObject(NavigationManager())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
