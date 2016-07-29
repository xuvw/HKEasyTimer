//
//  ViewController.swift
//  HKEasyTimer
//
//  Created by heke on 16/7/30.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let timer = NSTimer.hk_scheduledTimerWith(timeInterval: 3,
                                                  fireCallback: {
                                                    print("fire")
                                                  },
                                                  shouldRepeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

