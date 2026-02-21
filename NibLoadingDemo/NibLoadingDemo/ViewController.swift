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

    var nameAgeArray = [
        ("Ted", 50),
        ("Charlotte", 39),
        ("Angel", 22),
        ("Monte", 18),
        ("Jessica", 18)
    ]
    var nextPersonIndex: Int = 0

    // {{## START addPerson ##}}
    @IBAction func addPerson(_ sender: Any) {
        // Instantiate a PersonPanel from the XIB
        let nib = Bundle.main.loadNibNamed("PersonPanel", owner: self)
        let nibView = (nib?.first) as! UIView // this is the UIStackView
        // {{## END addPerson ##}}

        NSLog("nibView has \(nibView.subviews.count) subviews") // 1 -- the UIStackView
        NSLog("nibView.subviews[0].subviews has \(nibView.subviews[0].subviews.count) subviews") // 2 -- the label and the button

        // {{## START configureNibControls ##}}
        // Find the label in the nib and set its text
        let nibLabel = nibView.subviews[0].subviews[0] as! UILabel
        nibLabel.text = "\(nameAgeArray[nextPersonIndex].0) : \(nameAgeArray[nextPersonIndex].1)"
        
        // Wire up the nibButton to point to a function in this ViewController
        let nibButton = nibView.subviews[0].subviews[1] as! UIButton
        nibButton.tag = nextPersonIndex
        // {{## END configureNibControls ##}}

        // {{## START wiring ##}}
        nibButton.addTarget(self, action: #selector(happyBirthdayPushed(_:)), for: .touchUpInside)
        // {{## END wiring ##}}

        // {{## START addNibViews ##}}
        // Add the subview but use the "arranged" version so that it will be arranged according to the rules of a UIStackView
        contentView.addArrangedSubview(nibView)
        // {{## END addNibViews ##}}

        // Bump the index so we can rotate through the arrays of people
        nextPersonIndex += 1
        if nextPersonIndex == (nameAgeArray.count) {
            nextPersonIndex = 0
        }
    }
    
    // {{## START hostedButtonHandler ##}}
    @objc func happyBirthdayPushed(_ sender: UIButton) {
        // Go get the "tag" value associated with our button
        // Remember, that's our index into the nameAgeArray
        let index = sender.tag

        // Update the array with the new age; tuples are value types, so we need to extract the pair, update the age in it locally, then store that new value back into the array
        var nameAgePair = nameAgeArray[index]
        nameAgePair.1 = nameAgePair.1 + 1
        nameAgeArray[index] = nameAgePair
        // Could also one-liner this like so:
        //nameAgeArray[index] = (nameAgeArray[index].0, nameAgeArray[index].1 + 1)

        // Go find our paired label by looking at the UIStackView's children and getting the first one; update it with the new ages
        let pairedLabel = sender.superview!.subviews[0] as! UILabel
        pairedLabel.text = "\(nameAgePair.0) : \(nameAgePair.1)"

        NSLog("Happy Birthday, \(nameAgePair.0) you are now \(nameAgePair.1)")
    }
    // {{## END hostedButtonHandler ##}}
}

