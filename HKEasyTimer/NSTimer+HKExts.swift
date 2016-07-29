//
//  NSTimer+HKExts.swift
//  HKEasyTimer
//
//  Created by heke on 16/7/30.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

class HKTimerProxy: NSObject {
    var fireCallback: (() ->Void)?
}

extension NSTimer {
    /**
     此timer默认不重复fire
     */
    class func hk_scheduledTimerWith(timeInterval timeInterval: NSTimeInterval,
                                                  fireCallback: (() ->Void),
                                                  shouldRepeats: Bool = false) -> NSTimer {
        
        let proxy = HKTimerProxy()
        proxy.fireCallback = fireCallback
        
        let aTimer = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
                                                            target: self,
                                                            selector: #selector(NSTimer.fireAction(_:)),
                                                            userInfo: proxy,
                                                            repeats: shouldRepeats)
        
        
        return aTimer
    }
    
    class func fireAction(timer: NSTimer) {
        
        let proxy = timer.userInfo as? HKTimerProxy
        proxy?.fireCallback?()
    }
}