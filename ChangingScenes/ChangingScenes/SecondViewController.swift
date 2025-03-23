//
//  SecondViewController.swift
//  ChangingScenes
//
//  Created by Ted Neward on 5/20/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblSourceData: UILabel!
    
    var sourceData = "(No sourceData given)"
    var incomingSegue : UIStoryboardSegue? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSLog("SecondViewController self.sourceData = \(sourceData)")
        lblSourceData.text = sourceData
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    //}

    @IBAction func btnDismissPressed(_ sender: Any) {
        NSLog("\(#function)")
        
        incomingSegue?.source.dismiss(animated: true) {
            NSLog("Dismiss completion handler")
        }
    }
    
    @IBAction func btnUnwindPressed(_ sender: Any) {
        NSLog("\(#function)")
    }
}
