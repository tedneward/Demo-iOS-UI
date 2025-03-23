//
//  ViewController.swift
//  AlertFun
//
//  Created by Ted Neward on 9/21/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // {{## BEGIN alert ##}}
  @IBAction func alertPressed(_ sender: Any) {
    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK",
                                  style: .default,
                                  handler: { _ in
      NSLog("\"OK\" pressed.")
    }))
    alert.addAction(UIAlertAction(title: "Cancel",
                                  style: .cancel,
                                  handler: { _ in
      NSLog("\"Cancel\" pressed.")
    }))
    self.present(alert, animated: true, completion: {
      NSLog("The completion handler fired")
    })
  }
  // {{## END alert ##}}
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

