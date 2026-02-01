//
//  ViewController.swift
//  ManualUI
//
//  Created by Ted Neward on 3/26/22.
//

import UIKit

class ViewController: UIViewController {

    // {{## BEGIN viewDidLoad-1 ##}}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // At this point, the UI is completely empty.
        // Create a static text field, and a button
        // and wire up an event handler to the button.
        
    // {{## END viewDidLoad-1 ##}}

    // {{## BEGIN viewDidLoad-2 ##}}
        let label = UILabel()
        label.frame = CGRect(x: 20.0, y: 20.0,
                             width: self.view.frame.width - 40.0,
                             height: 20.0)
        label.text = "Howdy"
        label.textAlignment = .center
        view.addSubview(label)
    // {{## END viewDidLoad-2 ##}}
        
    // {{## BEGIN viewDidLoad-3 ##}}
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20.0, y:50.0,
                              width: self.view.frame.width - 40.0,
                              height: 20.0)
        button.setTitle("Push Me!", for: .normal)
        button.backgroundColor = .lightGray
        button.tintColor = .white
        button.addTarget(self,
                         action: #selector(buttonPressed(event:)),
                         for: .touchUpInside)
        view.addSubview(button)
    }
    // {{## END viewDidLoad-3 ##}}

    // {{## BEGIN buttonHandler ##}}
    @IBAction func buttonPressed(event: UIEvent) {
        let alert = UIAlertController(title: "Hello!", message: "You pushed the button", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
    // {{## END buttonHandler ##}}
}

