//
//  ViewController.swift
//  Pickers
//
//  Created by Ted Neward on 11/4/16. Updated 3/2/2024.
//

import UIKit

/*
This could be generalized further by taking an
array of strings in an initializer and using that
instead of the fixed array listed here, but that's
an enhancement that doesn't really add much to
the demo code. For production purposes, though, it's
absolutely an enhancement I'd suggest.
 */
class StringPickerModel : NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
  let data = [
    "UW", "WASU", "USC", "UCD", "UCLA", "OU", "OSU"
  ]
  
  private var selectedRow : Int = 0
  var selectedData : String {
    get { return data[selectedRow] }
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return data.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return data[row]
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.selectedRow = row
  }
}

class ViewController: UIViewController, UIPickerViewDelegate {
  /*
   This is code related to the Date picker
   */
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBAction func datePickerPicked(_ sender: UIDatePicker) {
    let date = datePicker.date.description
        // Note that the date will be in GMT, not local time
    
    let alert = UIAlertController(title: "DatePicker", message: "You chose \(date)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

    if self.presentedViewController == nil {
      self.present(alert, animated: true, completion: nil)
    } else {
      self.presentedViewController!.present(alert, animated: true, completion: nil)
    }
  }

  /*
   This is code related to the string picker
   */
  @IBOutlet weak var stringPicker: UIPickerView!
    
  let stringPickerModel : StringPickerModel = StringPickerModel()

  // The name "pickerView" is set in stone because we must conform to the
  // UIPickerViewDelegate protocol, which is where it is defined. If we had
  // multiple pickers we wanted to listen to, we'd need to create explicit
  // object instances that each conform to that protocol and implement this
  // method, and assign each as delegates to the respective pickers.
  func pickerView(_ view: UIPickerView, didSelectRow: Int, inComponent: Int) {
      let selected = stringPickerModel.data[didSelectRow]
      let alert = UIAlertController(title: "StringPicker", message: "You chose \(selected)", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

      if self.presentedViewController == nil {
        self.present(alert, animated: true, completion: nil)
      } else {
        self.presentedViewController!.present(alert, animated: true, completion: nil)
      }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    stringPicker.delegate = stringPickerModel
    stringPicker.dataSource = stringPickerModel
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

