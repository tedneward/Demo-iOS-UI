//
//  ViewController.swift
//  ManualUI
//
//  Created by Ted Neward on 4/20/22.
//

import UIKit

class ViewController: UIViewController {

  // {{## BEGIN viewDidLoad-1 ##}}
  override func viewDidLoad() {
    super.viewDidLoad()
    // {{## END viewDidLoad-1 ##}}

    // Do any additional setup after loading the view.
    let width : CGFloat = ((self.view.frame.width - 64) / 3).rounded()
    let height : CGFloat = ((self.view.frame.height - 64) / 3).rounded()
    let size = width < height ? width : height
    print("width \(width) height \(height) size \(size)")
    
    var coords : [[CGRect]] = [[CGRect]](repeating: [CGRect](repeating: CGRect(), count: 3), count: 3)
    for y in 0...2 {
      for x in 0...2 {
        coords[y][x] = CGRect(
          x: (16.0 * CGFloat(x+1)) + (size * CGFloat(x)),
          y: (16.0 * CGFloat(y+1)) + (size * CGFloat(y)) + 16.0, // just some additional padding
          width: size,
          height: size
        )
      }
    }
    print("coords \(coords)")
    
    // {{## BEGIN viewDidLoad-2 ##}}
    for num in 1...9 {
      let button = UIButton(type: .roundedRect)
      button.setTitle(num.description, for: .normal)
      button.tag = num
      button.backgroundColor = .lightGray
      button.frame = coords[((num-1) / 3)][((num-1) % 3)]

      self.view.addSubview(button)
      // {{## END viewDidLoad-2 ##}}

      // {{## BEGIN viewDidLoad-3 ##}}
      button.addTarget(self, action: #selector(buttonHandler(_:)), for: .touchUpInside)
      // {{## END viewDidLoad-3 ##}}
    }

  }
  
  // {{## BEGIN buttonHandler ##}}
  @objc func buttonHandler(_ sender: UIButton) {
    print("Button \(sender.tag) was pressed")
  }
  // {{## END buttonHandler ##}}
}

