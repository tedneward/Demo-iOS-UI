//
//  LifecycleViewController.swift
//  VCFun
//
//  Created by Ted Neward on 5/4/22.
//

import UIKit

//: # A UIViewController subclass that overrides *literally* every method it can.
//: This class is intended to help us get a sense of what methods are invoked, when
//: and to the extent possible, why.
class LifecycleViewController: UIViewController {

    @IBAction func onDismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear(animated:\(animated))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear(animated:\(animated))")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear(animated:\(animated))")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear(\(animated)")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("viewWillLayoutSubviews()")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews()")
    }

    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        
        print("willMove(\(parent.debugDescription))")
    }
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        print("didMove(\(parent.debugDescription))")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        print("viewWillTransition(size:\(size), with:\(coordinator))")
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        super.willRotate(to: toInterfaceOrientation, duration: duration)
        
        print("[deprecated] willRotate(\(toInterfaceOrientation), \(duration))")
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        super.didRotate(from: fromInterfaceOrientation)
        
        print("[deprecated] didRotate(\(fromInterfaceOrientation))")
    }
    
    // Key-Value Coding (comes from NSObject, but let's see if it gets called!
    override class func willChangeValue(forKey key: String) {
        super.willChangeValue(forKey: key)
        
        print("[NSObject]willChangeValue(\(key)")
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        print("viewSafeAreaInsetsDidChange()")
    }
    
    // Segue support
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("shouldPerformSegue(\(identifier), \(sender.debugDescription))")
        return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    }
    
    override func prepare(for forSegue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: forSegue, sender: sender)
        
        print("prepare(\(forSegue.debugDescription), \(sender.debugDescription)")
    }
    override func performSegue(withIdentifier: String, sender: Any?) {
        super.performSegue(withIdentifier: withIdentifier, sender: sender)
        
        print("performSegue(\(withIdentifier), \(sender.debugDescription)")
    }
    override func allowedChildrenForUnwinding(from: UIStoryboardUnwindSegueSource) -> [UIViewController] {
        print("allowedChildrenForUnwinding(\(from)")
        return super.allowedChildrenForUnwinding(from: from)
    }
    override func childContaining(_ source: UIStoryboardUnwindSegueSource) -> UIViewController? {
        return super.childContaining(source)
    }
    override func canPerformUnwindSegueAction(_ selector: Selector, from: UIViewController, sender: Any?) -> Bool {
        return super.canPerformUnwindSegueAction(selector, from: from, sender: sender)
    }
    override func unwind(for forSegue: UIStoryboardSegue, towards: UIViewController) {
        super.unwind(for: forSegue, towards: towards)
        
        print("unwind(for:\(forSegue), towards:\(towards))")
    }
}
