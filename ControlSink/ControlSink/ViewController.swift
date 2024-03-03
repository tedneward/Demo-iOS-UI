//
//  ViewController.swift
//  ControlSink
//
//  Created by Ted Neward on 11/3/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func pushMePushed(_ sender: UIButton) {
    message(title: "Hello!", message: "You pushed me!")
  }
  @IBAction func firstSecondThirdChanged(_ sender: UISegmentedControl) {
    var which = "???"
    switch firstSecondThird!.selectedSegmentIndex {
      case 0: which = "First"
      case 1: which = "Second"
      case 2: which = "Third"
      default: which = "?????"
    }
    message(title: "You changed to want", message: which)
  }
  
  @IBAction func somebodyTyped(_ sender: UITextField) {
    message(title:"Text field sez...", message: textField.text!)
  }
  
  @IBAction func sliderSlid(_ sender: UISlider) {
    sliderValueLabel.text! = String(slider.value)
  }
  
  @IBAction func switchSwitched(_ sender: UISwitch) {
    sliderValueLabel.isHidden = !switchSwitched.isOn
  }
  
  @IBOutlet weak var firstSecondThird: UISegmentedControl!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var switchSwitched: UISwitch!
  @IBOutlet weak var sliderValueLabel: UILabel!

  private func message(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .default)
    alert.addAction(defaultAction)
    present(alert, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

