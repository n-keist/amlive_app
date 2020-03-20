//
//  MediaPermissionHandler.swift
//  Runner
//
//  Created by Nikolaj Keist on 20.03.20.
//

import Foundation
import LFLiveKit

class MediaPermissionHandler {
    
    func requestAccessVideo() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        var result = false
        switch status {
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted) in
                result = true
            }
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            result = true
        @unknown default:
            break
        }
        return result
    }
    
    func requestAccessAudio() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        var result = false
        switch status {
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.audio) { (granted) in
                result = true
            }
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            result = true
        @unknown default:
            break
        }
        return result
    }
    
}
