//
//  LiveView.swift
//  Runner
//
//  Created by Nikolaj Keist on 23.03.20.
//

import Foundation
import UIKit
import LFLiveKit

public class LiveView: NSObject, FlutterPlatformView, LFLiveSessionDelegate {
    
    
    let frame: CGRect
    let viewId: Int64
    let channel: FlutterMethodChannel
    let session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.defaultConfiguration(for: LFLiveAudioQuality.medium)
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.low3)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        return session!
    }()
    var container: UIView
    
    init(_ frame: CGRect, viewId: Int64, channel: FlutterMethodChannel, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.channel = channel
        
        
        self.container = {
            let containerView = UIView(frame: frame)
            return containerView
        }()
        
        super.init()
        
        session.running = true
        session.captureDevicePosition = .front
        session.delegate = self
        session.preView = container
        
        channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == "initialize" {
                let stream = LFLiveStreamInfo()
                stream.url = "rtmp://192.168.178.45:1935/live/noko"
                self.session.startLive(stream)
                result(true)
            }
        }
    }
    
    public func view() -> UIView {
        return container
    }
}
