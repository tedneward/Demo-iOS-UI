//
//  CustomViewController.swift
//  ViewBehavior
//
//  Created by Ted Neward on 4/23/24.
//

import UIKit

// {{## BEGIN touch-recognition ##}}
class CustomView: UIView {
  override func touchesEnded(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    let location = touches.first?.location(in: self)
    NSLog("Received touchesEnded \(String(describing: location))")
      
    let scene = self.window?.windowScene
    let vc = scene?.windows.first?.rootViewController as! CustomViewController
      
    //let vc =
    //  UIApplication.shared.windows.first?.rootViewController
    //    as! CustomViewController
    vc.createView(location: location!)
  }
}
// {{## END touch-recognition ##}}

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

class CustomViewController: UIViewController {
    
    // {{## BEGIN clear ##}}
    @IBAction func clearPressed(_ sender: Any) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }
    // {{## END clear ##}}
    @IBAction func createPressed(_ sender: Any) {
        createView(location: <#T##CGPoint#>)
    }
    
    // {{## BEGIN create ##}}
    @IBOutlet weak var viewType: UISegmentedControl!
    @IBOutlet weak var segAlignment: UISegmentedControl!
    
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
      let childView = createViewType(frame: viewFrame)
      childView.backgroundColor = UIColor.red
      
      if isCenterAligned() {
        childView.center = location
        childView.backgroundColor = UIColor.blue
      }
      view.addSubview(childView)
    }
    // {{## END create ##}}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
}
