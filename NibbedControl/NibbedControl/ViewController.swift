//
//  ViewController.swift
//  NibbedControl
//
//  Created by Ted Neward on 2/3/26.
//

import UIKit

class CustomView: UIView {
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        NSLog("Received touchesEnded \(String(describing: location))")

        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?.windows
            .first(where: { $0.isKeyWindow })
        let vc = keyWindow?.rootViewController as! ViewController
        vc.createView(location: location!)
    }
}

class SquareView: UIView { }

class CircleView: UIView {
    override func draw(_ rect: CGRect) {
        let halfSize:CGFloat = min( bounds.size.width/2, bounds.size.height/2)
        let desiredLineWidth = CGFloat(1)
        let path = UIBezierPath(arcCenter: CGPoint(x:halfSize,y:halfSize),
                                radius: CGFloat( halfSize - (desiredLineWidth/2) ),
                                startAngle: CGFloat(0),
                                endAngle: CGFloat(Double.pi * 2),
                                clockwise: true)
        UIColor.black.setStroke()
        UIColor.green.setFill()
        path.fill()
        path.stroke()
    }
}

// {{## BEGIN customDrawing ##}}
class EllipseView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: self.bounds)
        UIColor.red.setStroke()
        UIColor.orange.setFill()
        path.fill()
        path.stroke()
    }
}
// {{## END customDrawing ##}}

class ViewController: UIViewController {
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var viewType: UISegmentedControl!
    @IBOutlet weak var segAlignment: UISegmentedControl!

    @IBAction func clearPressed(_ sender: Any) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }

    func isCenterAligned() -> Bool {
        return segAlignment.selectedSegmentIndex == 0
    }

    func createViewType(frame: CGRect) -> UIView {
        switch viewType!.selectedSegmentIndex {
        case 0:
          return EllipseView(frame: frame)
        case 1:
          return SquareView(frame: frame)
        case 2:
          return CircleView(frame: frame)
        default:
          return UIView(frame: frame)
        }
    }

    func createView(location: CGPoint) -> Void {
        let viewSize = CGSize(width: 50, height: 50)
        let viewFrame = CGRect(origin: location, size: viewSize)
        let childView = createViewType(frame: viewFrame);
        childView.alpha = CGFloat(alphaSlider.value);
        childView.backgroundColor = UIColor.red;
        view.addSubview(childView);

        if isCenterAligned() {
            childView.center = location
            childView.backgroundColor = UIColor.blue
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

