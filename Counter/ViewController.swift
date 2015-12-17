//
//  ViewController.swift
//  Counter
//
//  Created by huchunbo on 15/12/15.
//  Copyright © 2015年 Bijiabo. All rights reserved.
//

import UIKit
import RemoteControl

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var count: Int = 0 {
        didSet {
            label.text = "\(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RemoteControlManager.sharedManager.debug = false
        RemoteControlManager.sharedManager.masterButton.click = {
            print("hoho! click!!!")
        }
        
        RemoteControlManager.sharedManager.remoteControlReveivedWithEventHandler = {
            print("I am handler.")
        }
        
        RemoteControlManager.sharedManager.masterButton.click = {
            ++self.count
        }
        
        RemoteControlManager.sharedManager.masterButton.doubleClick = {
            --self.count
        }
        
        RemoteControlManager.sharedManager.masterButton.tripleClick = {
            self.count = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

