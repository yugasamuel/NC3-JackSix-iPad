//
//  QRGeneratorView.swift
//  OKLock
//
//  Created by Indah Rahmawati on 18/07/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CryptoKit

struct QRGeneratorView: View {
    @State var generatedQRCode: UIImage?
    @State var encryptedData: String = ""
    let keyString = "kuncikebenaran"
    @State var key: SymmetricKey?
    
    
    var body: some View {
        VStack {
            if let qrCodeImage = generatedQRCode {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }.onAppear(perform: {
            generateUUIDCode()
        })
    }
    
    func generateQRpic(dataQR: Data) {
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(dataQR, forKey: "inputMessage")
            filter.setValue("Q", forKey: "inputCorrectionLevel")
            if let ciImage = filter.outputImage {
                let context = CIContext()
                if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
                    let uiImage = UIImage(cgImage: cgImage)
                    generatedQRCode = uiImage
                }
            }
        }
    }
    
    func generateUUIDCode(){
        let UUID = generateUUID()
        var dataQR = UUID
        
        guard !dataQR.isEmpty else {
            return
        }
        do {
            key = try generateSymmetricKey(fromString: keyString)
            encryptedData = try encryptData(stringMessage: dataQR, key: key!)
            print("Encrypted Data: \(encryptedData)")

        } catch {
            print("Error: \(error)")
        }
        let dataQRdata = Data(encryptedData.utf8)
        generateQRpic(dataQR: dataQRdata)
//        generateQRpic(dataQR: dataQR.data(using: .utf8)!)
//        generateQRpic(dataQR: UUID)

    }
    
    

}

struct QRGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        QRGeneratorView()
    }
}

