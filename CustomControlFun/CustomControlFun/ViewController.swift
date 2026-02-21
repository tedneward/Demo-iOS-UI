//
//  ViewController.swift
//  CustomControlFun
//
//  Created by Ted Neward on 10/23/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

// This example taken from Apple documentation.
// https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ImplementingACustomControl.html
// See that link for full details.
//


class ViewController: UIViewController {
  // {{## BEGIN ratingControlVar ##}}
  @IBOutlet weak var ratingControl: RatingControl!
  // {{## END ratingControlVar ##}}

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

