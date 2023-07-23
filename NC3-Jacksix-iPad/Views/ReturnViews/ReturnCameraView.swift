//
//  ReturnCameraView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI
import CryptoKit

struct ReturnCameraView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var encryptedData: String = ""
    private let keyString = "kuncikebenaran"
    @State private var key: SymmetricKey?
    @State private var isShowingScanner = true
    @State var scannedCode: String?
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("Arahkan kode QR ke pemindai:")
                .font(.system(size: 45).bold())
                .multilineTextAlignment(.center)
                .frame(width: 850)
                .padding(30)
            
            if isShowingScanner {
                QRScannerView(scannedCode: $scannedCode, isShowingScanner: $isShowingScanner)
                    .frame(maxWidth: 500, maxHeight: 400)
            } else {
                if let decryptedCode = decrypt() {
                    let code = decryptedCode
                    //                    dataProcess(scannedCode: scannedCode!)
                    Text("Scanned QR Code: \(code)")
                        .font(.headline)
                        .padding()
                    Text("iuehr")
                    
                } else {
                    Text("Failed to decrypt QR code")
                        .font(.headline)
                        .padding()
                }
            }
            
//            NavigationLink(value: SelectionState.returnSuccess) {
//                Rectangle()
//                    .stroke()
//                    .frame(width: 500, height: 400)
//                    .background(.secondary.opacity(0.3))
//                    .padding()
//            }
//            
            NavigationLink(value: SelectionState.returnSuccess) {
                Rectangle()
                    .stroke()
                    .frame(width: 500, height: 40)
                    .background(.secondary.opacity(0.3))
                    .padding()
            }
            
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
      
    func checkDecryptedString(decrypted: String) {
        for i in ipadDataArray {
            if decrypted == i.UUIDString {
                addToHistoryData(UUIDStringHistory: decrypted)
                removeFromIpadData(UUIDString: decrypted)
                
            }
            else {
                print("gaada yang cocok")
            }
        }
                    
    }
    func decrypt() -> String? {
        do {
            guard let code = scannedCode else {
                return nil
            }
            
            let key = try generateSymmetricKey(fromString: keyString)
            let decryptedData = try decryptData(sealedBoxBaseString: code, key: key)

            print("Decrypted Data: \(decryptedData)")
            print(type(of: key))
            
            return decryptedData
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
        
}

struct ReturnCameraView_Previews: PreviewProvider {
    static var previews: some View {
        ReturnCameraView()
            .environmentObject(NavigationManager())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
