//
//  RecordViewController.swift
//  TestTest
//
//  Created by Xu, Jay on 8/18/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController,orientationIsOnlyLandscape {
    
    lazy var cameraSession: AVCaptureSession = {
        let s = AVCaptureSession()
        s.sessionPreset = AVCaptureSessionPresetHigh
        return s
    }()
    
    lazy var previewLayer: AVCaptureVideoPreviewLayer = { [unowned self] in
        let preview =  AVCaptureVideoPreviewLayer(session: self.cameraSession)
        preview?.position = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        preview?.videoGravity = AVLayerVideoGravityResizeAspectFill
        preview!.connection.videoOrientation = .landscapeLeft
        preview!.frame = self.view.bounds
        return preview!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraSession()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(orientationHandler),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }
    
    func orientationHandler(){
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.landscapeLeft, andRotateTo: .landscapeLeft)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layer.addSublayer(previewLayer)
        cameraSession.startRunning()
    }
    
    func setupCameraSession() {
        let deviceSession = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInWideAngleCamera],
                                                            mediaType: AVMediaTypeVideo,
                                                            position: .back)
        var captureDevice:AVCaptureDevice?
        for device in deviceSession!.devices {
            if device.position == .back {
                captureDevice = device
            }
        }
        
        do {
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            if (cameraSession.canAddInput(deviceInput) == true) {
                cameraSession.addInput(deviceInput)
            }
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    func startRecording(){
        
//        let videoOutput = AVCaptureMovieFileOutput()
//        cameraSession.addOutput(videoOutput)
//        videoOutput.startRecording(toOutputFileURL: <#T##URL!#>, recordingDelegate: self)
    }
}

extension RecordViewController:AVCaptureFileOutputRecordingDelegate {
    func capture(_ captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAt outputFileURL: URL!, fromConnections connections: [Any]!, error: Error!) {
        print("here")
    }
}


