//
//  cameraScanView.swift
//  NC3-Jacksix-iPad
//
//  Created by Indah Rahmawati on 23/07/23.
//

import SwiftUI
import CryptoKit


struct ScanView: View {
    @State private var encryptedData: String = ""
    private let keyString = "kuncikebenaran"
    @State private var key: SymmetricKey?
    @State private var isShowingScanner = false
    @State var scannedCode: String?
    
    var body: some View {
        VStack {
            if isShowingScanner {
                QRScannerView(scannedCode: $scannedCode, isShowingScanner: $isShowingScanner)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                
                Button(action: {
                    isShowingScanner = true
                }) {
                    Text("Scan QR Code")
                        .font(.title)
                        .bold()
                        .padding(30)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                }
            }
        }
        .navigationBarTitle("OKLock MRT")
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



struct ScanView_Previews: PreviewProvider {
    static var previews: some View {

            ScanView()
        
    }
}
