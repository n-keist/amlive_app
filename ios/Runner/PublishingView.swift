//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Nikolaj Keist on 03.03.20.
//

import UIKit
import LFLiveKit

public class PublishingView: NSObject, LFLiveSessionDelegate, FlutterPlatformView {
    
    //MARK: - Getters and Setters
    
    var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.defaultConfiguration(for: LFLiveAudioQuality.medium)
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.low3)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        return session!
    }()
    
    var containerView: UIView = {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()
    
    var frame: CGRect
    var viewId: Int64
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    
    public func view() -> UIView {
        return self.containerView
    }
    
}

public class PublishingViewFactory : NSObject, FlutterPlatformViewFactory{
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return PublishingView(frame, viewId: viewId, args: args)
    }
}
