//
//  SecondViewController.swift
//  StoryboardFun
//
//  Created by Ted Neward on 10/22/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

// {{## BEGIN segue-destination ##}}
class SecondViewController: UIViewController {
  public var incomingText: String! = nil
  func setIncomingText(incoming: String) {
    self.incomingText = incoming
  }

  @IBOutlet weak var txtLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    if incomingText != nil {
      self.txtLabel.text = incomingText
    }
  }

  @IBAction func btnReturnPressed(_ sender: Any) {
    dismiss(animated: true) {
      NSLog("Dismissed")
    }
  }
// {{## END segue-destination ##}}

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
