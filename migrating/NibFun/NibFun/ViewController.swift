//
//  ViewController.swift
//  NibFun
//
//  Created by Ted Neward on 10/22/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // {{## BEGIN view-with-class-parent ##}}
  @IBOutlet weak var contentView: UIView!
  // {{## END view-with-class-parent ##}}

  @IBOutlet weak var sharedViewPlaceholder: UIView!

  @IBAction func ordinaryPressed(_ sender: UIButton) {
    NSLog("Ordinary button pressed")
  }

  // {{## BEGIN vc-with-nib ##}}
  @IBAction func NVCButtonPressed(_ sender: Any) {
    NSLog("NVCButtonPressed")
    let nvc = NibViewController()
    present(nvc, animated: true) {
      NSLog("NVC presented")
    }
  }
  // {{## END vc-with-nib ##}}
  @IBAction func dismissPressed(_ sender: Any) {
    NSLog("Dismiss button pressed")
    self.dismiss(animated: true) {
      NSLog("Dismiss completed")
    }
  }
  
  
  @IBAction func buttonPressed(_ sender: Any) {
    NSLog("The SharedView found this selector!")
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    // {{## BEGIN view-with-class ##}}
    if let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first! as? CustomView {
      contentView.addSubview(customView)
      customView.frame = contentView.bounds
    }
    // {{## END view-with-class ##}}
    // Above code can also use auto-layout approach to control bounds
    // like so:
    /*
     customView.translatesAutoresizingMaskIntoConstraints = false
     contentView.addConstraints(
       NSLayoutConstraint.constraints(
       withVisualFormat: "H:|-0-[view]-0-|",
       options: [],
       metrics: nil,
       views: ["view":customView]))
     contentView.addConstraints(
       NSLayoutConstraint.constraints(
       withVisualFormat: "V:|-0-[view]-0-|",
       options: [],
       metrics: nil,
       views: ["view":customView]))
     */

    // {{## BEGIN no-logic-nib ##}}
    if let sharedView =
      Bundle.main.loadNibNamed("SharedView",
                               owner: self,
                               options: nil)?.first! as? UIView {
      sharedView.frame = sharedViewPlaceholder.frame.offsetBy(dx: 0.0, dy: 0.0)
      sharedView.frame.size.height = CGFloat(50.0)
      view.addSubview(sharedView)
    }
    // {{## END no-logic-nib ##}}
    
    if let sharedView =
      Bundle.main.loadNibNamed("SharedView",
                               owner: self,
                               options: nil)?.first! as? UIView {
      sharedView.frame = sharedViewPlaceholder.frame
      sharedView.frame.origin.y += CGFloat(60.0)
      sharedView.frame.size.height = CGFloat(50.0)
      view.addSubview(sharedView)
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

