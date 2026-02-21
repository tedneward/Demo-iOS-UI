//
//  RatingControl.swift
//  CustomControlFun
//
//  Created by Ted Neward on 10/23/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

// {{## BEGIN header ##}}
@IBDesignable class RatingControl: UIStackView {
  
  private var ratingButtons = [UIButton]()
  var rating = 0 {
    didSet {
      updateButtonSelectionStates()
    }
  }
  @IBInspectable var starSize: CGSize = 
      CGSize(width: 44.0, height: 44.0) {
    didSet {
      setupButtons()
    }
  }
  @IBInspectable var starCount: Int = 5 {
    didSet {
      setupButtons()
    }
  }
  // {{## END header ##}}

  // {{## BEGIN images ##}}
  var filledStar : UIImage? = nil
  var emptyStar : UIImage? = nil
  var highlightedStar : UIImage? = nil
  private func setupImages() {
    if filledStar == nil {
      let bundle = Bundle(for: type(of: self))
      filledStar = UIImage(named: "filledStar", in: bundle,
                           compatibleWith: self.traitCollection)
      emptyStar = UIImage(named:"emptyStar", in: bundle,
                          compatibleWith: self.traitCollection)
      highlightedStar = UIImage(named:"highlightedStar", in: bundle,
                                compatibleWith: self.traitCollection)
    }
  }
  // {{## END images ##}}
  
  // {{## BEGIN initializers ##}}
  // MARK: Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImages()
    setupButtons()
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupImages()
    setupButtons()
  }
  // {{## END initializers ##}}
  

  // {{## BEGIN setupButtons ##}}
  private func setupButtons() {
    for button in ratingButtons {
      removeArrangedSubview(button)
      button.removeFromSuperview()
    }
    ratingButtons.removeAll()
    
    for _ in 0..<starCount {
      let button = setupButton()
      ratingButtons.append(button)
      addArrangedSubview(button)
    }
    updateButtonSelectionStates()
  }
  // {{## END setupButtons ##}}
  
  // {{## BEGIN setupButton ##}}
  private func setupButton() -> UIButton {
    let button = UIButton()

    button.setImage(emptyStar, for: .normal)
    button.setImage(filledStar, for: .selected)
    button.setImage(highlightedStar, for: .highlighted)
    button.setImage(highlightedStar, for: [.highlighted, .selected])
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
    button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
    
    button.addTarget(self, 
      action: #selector(RatingControl.ratingButtonTapped(button:)), 
      for: .touchUpInside)
    return button
  }
  // {{## END setupButton ##}}

  // {{## BEGIN ratingButton ##}}
  @objc func ratingButtonTapped(button: UIButton) {
    guard let index = ratingButtons.index(of: button) else {
      fatalError("\(button) not in \(ratingButtons)")
    }
    
    // Calculate the rating of the selected button
    let selectedRating = index + 1
    if selectedRating == rating {
      // If the selected star represents the current rating,
      // reset the rating to 0.
      rating = 0
    } else {
      // Otherwise set the rating to the selected star
      rating = selectedRating
    }
  }
  // {{## END ratingButton ##}}

  // {{## BEGIN updateButtonSelectionStates ##}}
  private func updateButtonSelectionStates() {
    for (index, button) in ratingButtons.enumerated() {
      // If the index of a button is less than the rating,
      // that button should be selected.
      button.isSelected = index < rating
    }
  }
  // {{## END updateButtonSelectionStates ##}}
}
