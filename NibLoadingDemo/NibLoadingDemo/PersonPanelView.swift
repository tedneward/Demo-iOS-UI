//
//  PersonPanelView.swift
//  NibLoadingDemo
//
//  Created by Ted Neward on 4/27/21.
//

import UIKit

/* This is for Option 2: A custom subclass of UIView
 * It uses the same XIB as Option 1, but encapsulates everything
 * in this subclass, and makes it easier to contain the model/data
 * in one place.
 */
class PersonPanelView: UIView {

    var data : (String, Int) = ("", -1) {
        didSet {
            // Update the label with modified data
            label.text = "\(data.0) : \(data.1)"
        }
    }
    
    weak var label : UILabel!
    weak var button : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubViews()
    }
    
    private func initSubViews() {
        // Instantiate the nib into existence
        let nib = UINib(nibName: "PersonPanel", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        // Get the view from the instantiated nib and add it into our own tree
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
        
        // Wire up the controls to this view
        label = (nibView.subviews[0].subviews[0] as! UILabel)
        label.text = "\(data.0) : \(data.1)"
        
        button = (nibView.subviews[0].subviews[1] as! UIButton)
        button.addTarget(self, action: #selector(happyBirthdayPushed(_:)), for: .touchUpInside)
    }
    
    @objc private func happyBirthdayPushed(_ sender : UIButton) {
        // Modify our internal data
        data = (data.0, data.1 + 1)
        
        // Update the label with modified data
        label.text = "\(data.0) : \(data.1)"

        NSLog("Happy Birthday, \(data.0) you are now \(data.1)")
    }

}
