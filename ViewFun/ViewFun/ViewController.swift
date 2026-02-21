//
//  ViewController.swift
//  ViewFun
//
//  Created by Ted Neward on 9/19/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

// {{## BEGIN touch-recognition ##}}
class CustomView: UIView {
  override func touchesEnded(_ touches: Set<UITouch>, 
                             with event: UIEvent?) {
    let location = touches.first?.location(in: self)
    NSLog("Received touchesEnded \(String(describing: location))")
    
    let vc = 
      UIApplication.shared.keyWindow?.rootViewController 
        as! ViewController
    vc.createView(location: location!)
  }
}
// {{## END touch-recognition ##}}

class ViewController: UIViewController {

  // {{## BEGIN clear ##}}
  @IBAction func clearPressed(_ sender: Any) {
    for subview in view.subviews {
      subview.removeFromSuperview()
    }
  }
  // {{## END clear ##}}

  // {{## BEGIN create ##}}
  @IBOutlet weak var alphaSlider: UISlider!
  @IBOutlet weak var segAlignment: UISegmentedControl!
  func isCenterAligned() -> Bool {
    return segAlignment.selectedSegmentIndex == 0
  }
  
  func createView(location: CGPoint) -> Void {
    let viewSize = CGSize(width: 50, height: 50)
    let viewFrame = CGRect(origin: location, size: viewSize)
    let childView = UIView(frame: viewFrame);
    childView.alpha = CGFloat(alphaSlider.value)
    childView.backgroundColor = UIColor.red
    view.addSubview(childView)
    
    if isCenterAligned() {
      childView.center = location
      childView.backgroundColor = UIColor.blue
    }
  }
  // {{## END create ##}}
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

