//
//  scannerController.swift
//  NC3-Jacksix-iPad
//
//  Created by Indah Rahmawati on 23/07/23.
//

import Foundation
import SwiftUI
import AVFoundation

class ScannerViewController: UIViewController {
    var delegate: QRScannerView.Coordinator?
    var orientation: AVCaptureVideoOrientation = .portrait
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            if let videoPreviewLayer = self.view.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
                if let connection = videoPreviewLayer.connection {
                    if connection.isVideoOrientationSupported {
                        connection.videoOrientation = orientation
                    }
                }
                videoPreviewLayer.frame = view.layer.bounds
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instead of getting the default camera, we will specifically search for the front camera.
        // This code block searches for the front camera and sets it as the capture device.
        var captureDevice: AVCaptureDevice? = nil
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .unspecified
        )
        for device in deviceDiscoverySession.devices {
            if device.position == .front {
                captureDevice = device
                break
            }
        }
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice!) else {
            print("Failed to create input device")
            return
        }
        
        let captureSession = AVCaptureSession()
        captureSession.addInput(input)
        
        let metadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.qr]
        
        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)
        
        captureSession.startRunning()
    }
}
