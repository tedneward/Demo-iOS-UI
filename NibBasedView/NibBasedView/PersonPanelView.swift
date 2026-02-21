//
//  PersonPanelView.swift
//  NibLoadingDemo
//
//  Created by Ted Neward on 4/27/21.
//

import UIKit

/* A custom subclass of UIView that encapsulates everything in this subclass,
 * and makes it easier to contain the model/data in one place.
 */
class PersonPanelView: UIView {
    // {{## START properties ##}}
    var data : (String, Int) = ("", -1) {
        didSet {
            // Update the label with modified data
            label.text = "\(data.0) : \(data.1)"
        }
    }
    
    weak var label : UILabel!
    weak var button : UIButton!
    // {{## END properties ##}}    
    
    // {{## BEGIN initializers-1 ##}}
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubViews()
    }
    // {{## END initializers-1 ##}}
    
    // {{## START initializers-2 ##}}
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
    // {{## END initializers-2 ##}}
    
    // {{## START eventhandler ##}}    
    @objc private func happyBirthdayPushed(_ sender : UIButton) {
        // Modify our internal data
        data = (data.0, data.1 + 1)
        
        // Update the label with modified data
        label.text = "\(data.0) : \(data.1)"

        NSLog("Happy Birthday, \(data.0) you are now \(data.1)")
    }
    // {{## END eventhandler ##}}    
}
