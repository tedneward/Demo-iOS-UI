//
//  ViewController.swift
//  StoryboardFun
//
//  Created by Ted Neward on 10/22/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

// {{## BEGIN segue-source ##}}
class MainViewController: UIViewController {
  @IBOutlet weak var txtData: UITextField!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier! {
    case "SVCSegue":
      let source = segue.source as! MainViewController
      let destination = segue.destination as! SecondViewController
      //destination.incomingText = source.txtData.text!
      // or
      destination.setIncomingText(incoming: source.txtData.text!)
    default:
      NSLog("Unknown segue identifier -- " + segue.identifier!)
    }
  }
// {{## END segue-source ##}}
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

