//
//  ViewController.swift
//  Appearance
//
//  Created by Ted Neward on 10/19/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var startX : Int = 0
  var startY : Int = 0
  
  // {{## BEGIN btnOne ##}}
  @IBOutlet weak var btnOne: UIButton!
  @IBAction func btnOnePressed(_ sender: Any) {
    NSLog("btnOnePressed")
    UIButton.appearance().backgroundColor = UIColor.red
    let newButton = UIButton(frame: CGRect(x: startX, y: startY, width: 140, height: 20))
    newButton.setTitle("NewButton", for: .normal)
    view.addSubview(newButton)
    startX = Int(newButton.frame.origin.x)
    startY = Int(newButton.frame.origin.y) + 30
  }
  // {{## END btnOne ##}}
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    startX = Int(btnOne.frame.origin.x)
    startY = Int(btnOne.frame.origin.y + btnOne.frame.height) + 60
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

