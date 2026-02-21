//
//  ViewController.swift
//  NibbedViewController
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        if let nibView = Bundle.main.loadNibNamed("NibbedView", owner: self, options: nil)?.first as? UIView {
            contentView.addSubview(nibView)
        }
    }
    
    @IBAction func buttonTapped() {
        print("Button tapped!")
    }
    
}

