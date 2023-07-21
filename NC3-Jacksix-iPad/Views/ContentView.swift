//
//  ContentView.swift
//  NC3-Jacksix-iPad
//
//  Created by Jason Leonardo on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var rent = Rent()
    
    var body: some View {
        NavigationStack(path: $navigationManager.selectionPath) {
            HStack {
                Spacer()
                NavigationLink(value: SelectionState.rentLocker) {
                    RentView()
                }
                Spacer()
                NavigationLink(value: SelectionState.returnItem) {
                    ReturnView()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(CustomColor.white)
            .navigationDestination(for: SelectionState.self) { state in
                switch state {
                case .rentLocker:
                    RentFormView(rent: rent)
                case .confirmation:
                    RentConfirmationView(rent: rent)
                case .scanning:
                    ScanningView()
                case .rentSuccess:
                    RentSuccessView()
                case .returnItem:
                    ReturnCameraView()
                case .returnSuccess:
                    ReturnSuccessView()
                }
            }
            .sheet(isPresented: $navigationManager.isInfoPresented) {
                SheetView()
            }
        }
    }
}

struct RentView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(CustomColor.pink)
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .shadow(radius: 6.5, y: 5)
                
                Image(systemName: "tray.and.arrow.down.fill")
                    .resizable()
                    .foregroundColor(CustomColor.darkBlue)
                    .bold()
                    .frame(width: 150, height: 150)
            }
            Text("Sewa Loker")
                .foregroundColor(CustomColor.darkBlue)
                .font(.system(size: 40))
                .bold()
                .padding()
        }
    }
}

struct ReturnView: View {
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(CustomColor.yellow)
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .shadow(radius: 6.5, y: 5)
                
                Image(systemName: "tray.and.arrow.up.fill")
                    .resizable()
                    .foregroundColor(CustomColor.darkBlue)
                    .bold()
                    .frame(width: 150, height: 150)
            }
            
            Text("Ambil Barang")
                .foregroundColor(CustomColor.darkBlue)
                .font(.system(size: 40))
                .bold()
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationManager())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
