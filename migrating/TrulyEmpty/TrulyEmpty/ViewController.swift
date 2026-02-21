//
//  ViewController.swift
//  TrulyEmpty
//
//  Created by Ted Neward on 5/2/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let label = UILabel(frame: self.view.frame.inset(by: UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)))
        label.numberOfLines = 0
        label.text = "This was created in the ViewController"

        self.view.addSubview(label)
    }
}

