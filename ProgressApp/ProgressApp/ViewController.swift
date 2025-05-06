//
//  ViewController.swift
//  ProgressApp
//
//  Created by Ted Neward on 5/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var edtParts: UITextField!
    var running : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblCount.text = "(Nothing)"
        progress.setProgress(0.0, animated: false)
    }

    @IBAction func startStop(_ sender: Any) {
        NSLog("startStop pressed")
        
        if running == false {
            // Get the number of steps to take
            let parts = Int(edtParts.text ?? "0") ?? 0
            NSLog("Doing \(parts)-step work")
            
            running = true
            spinner.startAnimating()
            btnStartStop.setTitle("Stop!", for: .normal)
            
            DispatchQueue.global().async {
                var count = 0
                while self.running && (count < parts) {
                    NSLog("Work... \(count) of \(parts)")
                    Thread.sleep(forTimeInterval: 1.0)
                    count += 1
                    DispatchQueue.main.async {
                        if self.running {
                            self.lblCount.text = "\(count)/\(parts) !"
                            self.progress.setProgress(Float(count) / Float(parts), animated: true)
                            self.lblCount.text = "\(count)/\(parts)"
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.btnStartStop.setTitle("Start", for: .normal)
                }
            }
        }
        else if btnStartStop.currentTitle == "Stop!" {
            NSLog("Stopping the work")
            btnStartStop.setTitle("Start!", for: .normal)
            running = false
            lblCount.text = "Interrupted"
            progress.setProgress(0.0, animated: false)
        }
    }
}

