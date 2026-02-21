//
//  ViewController.swift
//  VCFun
//
//  Created by Ted Neward on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onStoryboardInstantiate(_ sender: Any) {
        let target = storyboard?.instantiateViewController(withIdentifier: "instantiate")
        (target as! DismissViewController).message = "\(Date.now)"
        self.show(target!, sender: self)
        
    }
    @IBAction func onLaunchScreenInstantiate(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Secondary", bundle: nil)
        let target = storyboard.instantiateInitialViewController()
        (target as! DismissViewController).message = "\(Date.now)"
        self.show(target!, sender: self)
    }
    @IBAction func onScratch(_ sender: Any) {
        let target = CustomViewController()
        target.frameSize = self.view.frame
        target.message = "Scratch! \(Date.now)"
        target.loadViewIfNeeded()
        self.show(target, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DismissViewController {
            let dvc = segue.destination as! DismissViewController
            dvc.message = "Segue prepared \(Date.now)"
        }
    }
    @IBAction func unwound(unwindSegue: UIStoryboardSegue) {
        print("Unwound! \(unwindSegue.source) to \(unwindSegue.destination)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class CustomViewController:UIViewController {
    var message: String = ""
    var frameSize: CGRect!
    
    override func loadView() {
        // per Apple docs, do NOT call super.loadView()
        
        let rootView = UIView(frame: frameSize!)
        rootView.backgroundColor = UIColor.systemBackground
        self.view = rootView
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 80, height: 25))
        label.text = message
        self.view.addSubview(label)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 65, width: 80, height: 25)
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(dismissButtonPressed(_:)), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

class DismissViewController: UIViewController {
    
    var message: String = ""
    
    @objc func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in self.view.subviews {
            if view is UIButton {
                let viewBtn = view as? UIButton
                if viewBtn?.titleLabel?.text == "Dismiss" {
                    viewBtn?.addTarget(self, action: #selector(dismissButtonPressed(_:)), for: .touchUpInside)
                }
            }
            else if view is UILabel {
                let viewLbl = view as? UILabel
                viewLbl?.text = message
            }
        }
    }
}
