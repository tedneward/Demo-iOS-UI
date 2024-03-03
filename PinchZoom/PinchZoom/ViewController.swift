//
//  ViewController.swift
//  PinchZoom
//
//  Created by Ted Neward on 4/20/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!

  @IBOutlet weak var statusLabel: UILabel!

  var swipeRecognizer : UISwipeGestureRecognizer!
  
  var rotRecognizer : UIRotationGestureRecognizer!
  var rotationAngleRadians = 0.0 as CGFloat
  
  var pinchRecognizer : UIPinchGestureRecognizer!
  
  var tapRecognizer : UITapGestureRecognizer!
  
  @objc func handleTaps(sender : UITapGestureRecognizer) {
    NSLog("handleTaps: \(sender)")
    let text = "handleTaps: \(sender)"
    statusLabel.text = text
  }
  
  @objc func handlePinches(sender: UIPinchGestureRecognizer) {
    NSLog("handlePinches: sender: \(sender.state) scale: \(sender.scale) velocity \(sender.velocity)")
    
      if sender.state == .ended {
      if sender.velocity > 0 {
        NSLog("ZOOM ZOOM")
        let currSize = Float(label.font.pointSize)
          label.font = UIFont.systemFont(ofSize: CGFloat(currSize * 2.0))
      }
      else {
        let currSize = Float(label.font.pointSize)
          label.font = UIFont.systemFont(ofSize: CGFloat(currSize / 2.0))
        NSLog("OW PINCH")
      }
    }
  }
  
  @objc func handleRotations(sender: UIRotationGestureRecognizer) {
    NSLog("handleRotations fired: \(sender)")
    
    label.transform = CGAffineTransformMakeRotation(rotationAngleRadians + sender.rotation)
    
      if sender.state == .ended {
      rotationAngleRadians += sender.rotation
    }
  }
  
  @objc func handleSwipes(sender: UISwipeGestureRecognizer) {
    switch sender.direction {
    case UISwipeGestureRecognizer.Direction.down:
      label.text = label.text?.lowercased()
    case UISwipeGestureRecognizer.Direction.left:
      label.text = label.text?.lowercased()
    case UISwipeGestureRecognizer.Direction.up:
      label.text = label.text?.lowercased()
    case UISwipeGestureRecognizer.Direction.right:
        label.text = label.text?.lowercased()
    default:
      label.text = "UNK"
    }
    
  }
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
    label.sizeToFit()
    
    statusLabel.lineBreakMode = .byWordWrapping
    
    swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(sender:)))
      swipeRecognizer.direction = .left
    swipeRecognizer.numberOfTouchesRequired = 1
    view.addGestureRecognizer(swipeRecognizer)
    
    rotRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotations(sender:)))
    view.addGestureRecognizer(rotRecognizer)
    
    pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinches(sender:)))
    view.addGestureRecognizer(pinchRecognizer)
    
    tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTaps(sender:)))
    tapRecognizer.numberOfTapsRequired = 1
    tapRecognizer.numberOfTouchesRequired = 1
    view.addGestureRecognizer(tapRecognizer)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

