//
//  AlphaViewController.swift
//  ViewBehavior
//
//  Created by Ted Neward on 4/23/24.
//

import Foundation
import UIKit

class AlphaViewController : UIViewController {
    
    @IBOutlet weak var sldrSlider: UISlider!
    @IBOutlet weak var lblTarget: UILabel!

    @IBAction func sliderValueChanged(_ sender: Any, forEvent event: UIEvent) {
        let newValue = sldrSlider.value
        NSLog("Slider value changed, to \(newValue)")
        lblTarget.text = "Alpha = \(newValue)"
        lblTarget.alpha = CGFloat(newValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTarget.text = "Alpha = \(lblTarget.alpha)"
        sldrSlider.value = 1.0
    }
}
