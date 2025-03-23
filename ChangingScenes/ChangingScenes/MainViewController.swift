//
//  ViewController.swift
//  ChangingScenes
//
//  Created by Ted Neward on 5/20/24.
//

import UIKit

// The custom segue
class CustomMainToSecond : UIStoryboardSegue {
    var data = ""
    
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        NSLog("CustomMainToSecond segue initialized...")
        
        if let mainVC = source as? MainViewController {
            data = mainVC.sourceData
            
            if let secondVC = destination as? SecondViewController {
                secondVC.sourceData = data
            }
        }
    }
}

class MainViewController: UIViewController {
    
    let sourceData = "Sent at \(Date.now.description)"

    override func viewDidLoad() {
        super.viewDidLoad()

        NSLog("\(#function)")

        // Do any additional setup after loading the view.
        NSLog("Source data = \(sourceData)")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("\(#function)")
        
        NSLog("Preparing \(segue.identifier ?? "(nil)")")
        if segue.identifier == "CustomMainToSecond" {
            NSLog("... with '\(sourceData)'")
            
            // Populate the custom segue with our source data.
            // Trust either the segue to push the data to the
            // target view controller, or the target view controller
            // to get the data from the segue.
            //
            (segue as! CustomMainToSecond).data = sourceData
        }
        else if segue.identifier == "StockMainToSecond" {
            // Get hold of the destination from the segue
            let destination = segue.destination
            // We know it's the SecondViewController so downcast it
            let secondVC = destination as! SecondViewController
            // Push our data into the secondVC
            secondVC.sourceData = sourceData
            secondVC.incomingSegue = segue
        }
        else if segue.identifier == nil {
            if let secondVC = segue.destination as? SecondViewController {
                NSLog("Yup the direct route also has the destination set")
                secondVC.sourceData = sourceData
                secondVC.incomingSegue = segue
            }
        }
    }
    @IBAction func btnSeguePressed(_ sender: Any) {
        NSLog("\(#function)")

        NSLog("Initiating StockMainToSecond segue...")
        performSegue(withIdentifier: "StockMainToSecond", sender: self)
        NSLog("Exiting btnSeguePressed")
    }
    @IBAction func btnSegueWithDataPressed(_ sender: Any) {
        NSLog("\(#function)")

        NSLog("Initiating CustomMainToSecond segue...")
        performSegue(withIdentifier: "CustomMainToSecond", sender: self)
        NSLog("Exiting btnSegueWithDataPassed")
    }
}

