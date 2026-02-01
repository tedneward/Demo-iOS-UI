//
//  ViewController.swift
//  NibBasedView
//
//  Created by Ted Neward on 1/31/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contentView.distribution = .fillEqually
    }
    
    var nameAgeArray = [
        ("Ted", 50),
        ("Charlotte", 39),
        ("Angel", 22),
        ("Monte", 18),
        ("Jessica", 18)
    ]
    var nextPersonIndex: Int = 0
    
    @IBAction func addPerson(_ sender: Any) {
        let name = nameAgeArray[nextPersonIndex].0
        let age = nameAgeArray[nextPersonIndex].1
        
        let personPanel = PersonPanelView()
        personPanel.data = (name, age)
        contentView.addArrangedSubview(personPanel)

        // Bump the index so we can rotate through the arrays of people
        nextPersonIndex += 1
        if nextPersonIndex == (nameAgeArray.count) {
            nextPersonIndex = 0
        }
    }
    
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
}

