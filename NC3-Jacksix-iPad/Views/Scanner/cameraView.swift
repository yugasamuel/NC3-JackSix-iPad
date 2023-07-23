//
//  cameraView.swift
//  NC3-Jacksix-iPad
//
//  Created by Indah Rahmawati on 23/07/23.
//

import SwiftUI
import AVFoundation

struct QRScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String?
    @Binding var isShowingScanner: Bool
    
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        var parent: QRScannerView
        
        init(parent: QRScannerView) {
            self.parent = parent
        }
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
               let code = metadataObject.stringValue {
                parent.scannedCode = code
                parent.isShowingScanner = false
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> ScannerViewController {
          let scannerViewController = ScannerViewController()
          scannerViewController.delegate = context.coordinator
          
          // Set the desired orientation (landscape) here
          scannerViewController.orientation = .landscapeRight
          
          return scannerViewController
      }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}
}
