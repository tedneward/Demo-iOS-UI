//
//  ViewController.swift
//  GestureFun
//
//  Created by Ted Neward on 10/26/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var statusLabel: UILabel!

  // {{## BEGIN tap-handler ##}}
  var tapRecognizer : UITapGestureRecognizer!
  @objc func handleTaps(sender : UITapGestureRecognizer) {
    statusLabel.text = "handleTaps: \(sender)".replacingOccurrences(of: ";", with: "\n")
    label.text = "TAP!"
  }
  // {{## END tap-handler ##}}

  // {{## BEGIN pinch-handler ##}}
  var pinchRecognizer : UIPinchGestureRecognizer!
  @objc func handlePinches(sender: UIPinchGestureRecognizer) {
    statusLabel.text = "handlePinches: \n" +
      "sender: \(sender.state)\n" +
      "scale: \(sender.scale)\n" +
      "velocity: \(sender.velocity)"

    if sender.state == .ended {
      if sender.velocity > 0 {
        let currSize = Float(label.font.pointSize)
        label.font = UIFont.systemFont(ofSize: CGFloat(currSize * 2.0))
        label.text = "ZOOM ZOOM"
      }
      else {
        let currSize = Float(label.font.pointSize)
        label.font = UIFont.systemFont(ofSize: CGFloat(currSize / 2.0))
        label.text = "OW PINCH"
      }
    }
  }
  // {{## END pinch-handler ##}}

  // {{## BEGIN rotation-handler ##}}
  var rotRecgonizer : UIRotationGestureRecognizer!
  var rotationAngleRadians = 0.0 as CGFloat
  @objc func handleRotations(sender: UIRotationGestureRecognizer) {
    statusLabel.text = "handleRotations fired: \(sender)"
    label.transform = CGAffineTransform(rotationAngle: rotationAngleRadians + sender.rotation)
    if sender.state == .ended {
      rotationAngleRadians += sender.rotation
    }
  }
  // {{## END rotation-handler ##}}

  // {{## BEGIN swipe-handler ##}}
  var swipeRecognizer : UISwipeGestureRecognizer!
  @objc func handleSwipes(sender: UISwipeGestureRecognizer) {
    statusLabel.text = "handleSwipes: \(sender)"
    switch sender.direction {
    case UISwipeGestureRecognizerDirection.down:
      label.text = label.text?.lowercased()
    case UISwipeGestureRecognizerDirection.left:
      label.text = label.text?.lowercased()
    case UISwipeGestureRecognizerDirection.up:
      label.text = label.text?.lowercased()
    case UISwipeGestureRecognizerDirection.right:
      label.text = label.text?.lowercased()
    default:
      label.text = "UNK"
    }
  }
  // {{## END swipe-handler ##}}
  
  @IBAction func changeDirection(sender: UIButton) {
    view.removeGestureRecognizer(swipeRecognizer)
    
    switch sender.currentTitle! {
    case "Up":
      label.text = "UP"
      swipeRecognizer.direction = .up
    case "Down":
      label.text = "DOWN"
      swipeRecognizer.direction = .down
    case "Left":
      label.text = "LEFT"
      swipeRecognizer.direction = .left
    case "Right":
      label.text = "RIGHT"
      swipeRecognizer.direction = .right
    default:
      preconditionFailure("Should never happen!")
    }
    
    swipeRecognizer.numberOfTouchesRequired = 1
    view.addGestureRecognizer(swipeRecognizer)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    label.font = UIFont.systemFont(ofSize: 24)
    label.text = "LEFT"
    label.sizeToFit()

    statusLabel.lineBreakMode = .byWordWrapping

    // {{## BEGIN install-swipe ##}}
    swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
    swipeRecognizer.direction = .left
    swipeRecognizer.numberOfTouchesRequired = 1
    view.addGestureRecognizer(swipeRecognizer)
    // {{## END install-swipe }}

    // {{## BEGIN install-rotation ##}}
    rotRecgonizer = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotations(sender:)))
    view.addGestureRecognizer(rotRecgonizer)
    // {{## END install-rotation ##}}

    // {{## BEGIN install-pinch ##}}
    pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinches(sender:)))
    view.addGestureRecognizer(pinchRecognizer)
    // {{## END install-pinch ##}}

    // {{## BEGIN install-tap ##}}
    tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTaps(sender:)))
    tapRecognizer.numberOfTapsRequired = 1
    tapRecognizer.numberOfTouchesRequired = 1
    view.addGestureRecognizer(tapRecognizer)
    // {{## END install-tap ##}}
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

