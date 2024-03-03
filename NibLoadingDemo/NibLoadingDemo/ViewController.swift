//
//  ViewController.swift
//  NibLoadingDemo
//
//  Goal: When the user pushes the "Add Person" button at the top of this
//  screen, a "name/age" (and "Happy Birthday!" button) should appear in
//  a vertically-growing list. The Person "panel" should be loaded from a
//  XIB file, and when the "Happy Birthday!" button is pressed, it should
//  increment the Person's age, and the hosting ViewController (this one)
//  should present an Alert controller that says "Happy Birthday!"
//
//  Created by Ted Neward on 4/27/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPerson(_ sender: Any) {
        NSLog("Add Person")

        // Get a random name and age from out of nowhere
        let name = "Ted"
        let age = 50

        /* Option 1: The Hard Way
           Add a PersonPanel to the vertical center "the hard way":
            - create the raw nib file (File | New | File... | under User Interface select View), add controls into it (horizontal stack view with two children, one label and one button
            - instantiate the nib here using loadNibNamed(:owner) with an owner of nil since we want to do all the "wiring" up ourselves
            - take the resulting view from the nib (which will be the horizontal stack view) and add it into the view hierarchy under the vertical stack view (self.contentView)
            - wire up the button to print an NSLog()
         */
        /*
        nameAgeArray.append((name, age))
        NSLog("array: \(nameAgeArray)")
        
        // Instantiate a PersonPanel from the XIB
        let nib = Bundle.main.loadNibNamed("PersonPanel", owner: nil)
        let nibView = (nib?.first) as! UIView // this is the UIStackView

        NSLog("nibView has \(nibView.subviews.count) subviews") // 1 -- the UIStackView
        NSLog("nibView.subviews[0].subviews has \(nibView.subviews[0].subviews.count) subviews") // 2 -- the label and the button

        let nibLabel = nibView.subviews[0].subviews[0] as! UILabel
        nibLabel.text = "\(name) : \(age)"
        
        // Wire up the nibButton to point to a function in this ViewController
        let nibButton = nibView.subviews[0].subviews[1] as! UIButton
        nibButton.tag = nameAgeArray.count - 1 // this is our index into the nameAgeArray
        nibButton.addTarget(self, action: #selector(happyBirthdayPushed(_:)), for: .touchUpInside)
        
        // Add the subview but use the "arranged" version so that it will be arranged according to the rules of a UIStackView
        contentView.addArrangedSubview(nibView)
        // */
        
        /* Option 2: Create a custom UIView subclass to handle its own events */
        let personPanel = PersonPanelView()
        personPanel.data = (name, age)
        contentView.addArrangedSubview(personPanel)
    }
    
    // Option 1 supporting code
    /*
    var nameAgeArray : [(String, Int)] = [] // This is an array of (String, Int) tuples
    @objc func happyBirthdayPushed(_ sender: UIButton) {
        // Go get the "tag" value associated with our button
        // Remember, that's our index into the nameAgeArray
        let index = sender.tag

        // Update the array with the new age; tuples are value types, so we need to extract the pair, update the age in it locally, then store that new value back into the array
        var nameAgePair = nameAgeArray[index]
        nameAgePair.1 = nameAgePair.1 + 1
        nameAgeArray[index] = nameAgePair

        // Go find our paired label by looking at the UIStackView's children and getting the first one; update it with the new ages
        let pairedLabel = sender.superview!.subviews[0] as! UILabel
        pairedLabel.text = "\(nameAgePair.0) : \(nameAgePair.1)"

        NSLog("Happy Birthday, \(nameAgePair.0) you are now \(nameAgePair.1)")
    }
    // */

}

