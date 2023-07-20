//
//  SelectionView.swift
//  NC3-Jacksix-iPad
//
//  Created by Jason Leonardo on 20/07/23.
//

import SwiftUI

struct SelectionView: View {
    @EnvironmentObject var pageModel: PageNavigation
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                
                // Sewa Loker
                
                VStack{
                    Button(action: {
                        pageModel.pageIndex = 1
                      //  print(pageIndex)
                    }) {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color("rentLockerColor"))
                                .frame(width: 300, height: 300)
                                .cornerRadius(20)
                                .shadow(radius: 6.5, y: 5)
                            
                            Image(systemName: "tray.and.arrow.down.fill")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .bold()
                        }
                    }
                    .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button style
                    Text("Sewa Loker")
                        .font(.system(size: 40))
                        .bold()
                        .padding()
                }
                
                Spacer()
                
                // Ambil Barang
                
                VStack{
                    Button(action: {
                        // Handle button tap for "Ambil Barang"
                        // Add the code you want to run when the button is tapped
                    }) {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color("returnItemColor"))
                                .frame(width: 300, height: 300)
                                .cornerRadius(20)
                                .shadow(radius: 6.5, y: 5)
                            
                            Image(systemName: "tray.and.arrow.up.fill")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .bold()
                        }
                    }
                    .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button style
                    Text("Ambil Barang")
                        .font(.system(size: 40))
                        .bold()
                        .padding()
                }
                Spacer()
            }
            
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
