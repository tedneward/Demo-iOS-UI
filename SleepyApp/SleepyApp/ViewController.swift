//
//  ViewController.swift
//  SleepyApp
//
//  Created by Ted Neward on 5/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var button: UIButton!
    @IBAction func btnPressed(_ sender: Any) {
        NSLog("Entering btnPressed (\(Thread.current.description))")
        // First, disable the button (UI)
        button.isEnabled = false
        // Animate the spinner (UI)
        spinner.startAnimating()
        // Create a block of code to do the work
        DispatchQueue.global().async {
            // Do the work
            NSLog("Worker thread (\(Thread.current.description)): Do really complicated work here")
            Thread.sleep(forTimeInterval: 15) // (NOT UI)
            NSLog("Done with complicated work")
            
            DispatchQueue.main.async {
                NSLog("Re-enabling UI (\(Thread.current.description))")
                // De-animate the spinner (UI)
                self.spinner.stopAnimating()
                // Display the work (UI)
                // Enable the button (UI)
                self.button.isEnabled = true
            }
        }
        NSLog("Exiting btnPressed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

