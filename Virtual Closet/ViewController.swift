//
//  ViewController.swift
//  Virtual Closet
//
//  Created by Sudiksha Panda on 7/21/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Properties
    let captureSession = AVCaptureSession()
    
    
    func configureCameraInput() {
            // Check if the device has a camera with photo capability
            if let device = AVCaptureDevice.default(for: .video), device.hasMediaType(.video) && device.hasTorch {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if captureSession.canAddInput(input) {
                        captureSession.addInput(input)
                    }
                } catch {
                    print("Failed to access the camera.")
                }
            } else {
                print("No camera with photo capability found.")
            }
        }
    
    func addCameraPreview() {
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.insertSublayer(previewLayer, at: 0)
    }
    
    func startCaptureSession() {
        if !captureSession.isRunning {
            captureSession.startRunning()
        }
    }

    func stopCaptureSession() {
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Request camera permissions
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                DispatchQueue.main.async {
                    self.configureCameraInput()
                    self.addCameraPreview()
                    self.startCaptureSession()
                }
            } else {
                print("Camera access denied.")
            }
        }
    }
}

