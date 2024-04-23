//
//  SwitchingViewController.swift
//  ViewSwitcher
//
//  Created by Ted Neward on 10/24/15.
//  Updated on 4/22/24 to target later versions of iOS.
//

import UIKit

class SwitchingViewController: UIViewController {

    // {{## BEGIN fields ##}}
    var first : FirstViewController!
    var second : SecondViewController!
    // {{## END fields ##}}
    
    /*
    // {{## BEGIN switch-without-animation ##}}
    @IBAction func switchViews(sender: UIBarButtonItem) {
        if first != nil &&
            first.view.superview != nil {
            second.view.frame = view.frame
            switchViewController(first, to: second)
        }
        else {
            firstViewController.view.frame = view.frame
            switchViewController(second, to: first)
        }
    }
    // {{## END switch-without-animation ##}}
     */

    // {{## BEGIN switch-with-animation ##}}
    @IBAction func switchViews(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.4, animations: { [self] in
            if first != nil &&
                first.view.superview != nil {
                UIView.transition(with: view, duration: 0.4, options: [
                    .curveEaseInOut, .transitionFlipFromRight
                ], animations: {
                    self.second.view.frame = self.view.frame
                })
                switchViewController(first, to: second)
            }
            else {
                UIView.transition(with: view, duration: 0.4, options: [
                    .curveEaseInOut, .transitionFlipFromLeft
                ], animations: {
                    self.first.view.frame = self.view.frame
                })
                switchViewController(second, to: first)
            }
        })
    }
    // {{## END switch-with-animation ##}}
    
    // {{## BEGIN switchViewController ##}}
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController) {
        // Remove the old....
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }

        // ... swap in the new
        self.addChild(to)
        self.view.insertSubview(to.view, at: 0)
        to.didMove(toParent: self)
    }
    // {{## END switchViewController ##}}
    
    // {{## BEGIN builders ##}}
    // This is a "helper method" to instantiate from a storyboard
    // and deal automatically with the downcasting
    func instantiate<T>(id: String) -> T! {
        return storyboard?.instantiateViewController(withIdentifier: id) as? T
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        first = instantiate(id: "First")
        second = instantiate(id: "Second")
        switchViewController(nil, to: first)
    }
    // {{## END builders ##}}
}
