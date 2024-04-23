//
//  ViewController.swift
//  ActivitySpy
//
//  Created by Ted Neward on 3/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    var observer : Any? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let center = NotificationCenter.default
        let mainQueue = OperationQueue.main
        observer = center.addObserver(
            forName: nil,
            object: nil,
            queue: mainQueue) { (n) in
                NSLog("Received notification: \(n)")
            }
    }
}


