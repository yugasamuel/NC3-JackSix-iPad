//
//  SheetView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 20/07/23.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 60) {
            Text("Panduan ukuran loker")
                .font(.largeTitle.bold())
                .foregroundColor(CustomColor.darkBlue)
            HStack {
                VStack {
                    Image("helms")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 200)
                        .foregroundColor(CustomColor.darkBlue)
                        .cornerRadius(15)
                        .padding(.bottom)
                    Text("Sedang")
                        .font(.title.bold())
                        .foregroundColor(CustomColor.darkBlue)
                        .padding(.bottom)
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Tas Laptop")
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Helm Half Face")
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Pouch")
                        }
                    }
                    .font(.title.bold())
                    .foregroundColor(CustomColor.darkBlue)
                }
                VStack {
                    Image("suitcases")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 200)
                        .foregroundColor(CustomColor.darkBlue)
                        .cornerRadius(15)
                        .padding(.bottom)
                    Text("Besar")
                        .font(.title.bold())
                        .foregroundColor(CustomColor.darkBlue)
                        .padding(.bottom)
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Koper 20\"")
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Helm Full Face")
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text("Box Besar")
                        }
                    }
                    .font(.title.bold())
                    .foregroundColor(CustomColor.darkBlue)
                }
            }
            Button(action: {
                dismiss()
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
        }
        .padding()
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
