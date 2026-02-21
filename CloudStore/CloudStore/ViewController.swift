//
//  ViewController.swift
//  CloudStore
//
//  Created by Ted Neward on 11/18/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var document: Document?
  var documentURL: URL?
  
  @IBOutlet weak var textView: UITextView!
  // {{## BEGIN save ##}}
  @IBAction func savePushed(_ sender: Any) {
    document!.userText = textView.text
    
    document?.save(to: documentURL!,
                   for: .forOverwriting,
                   completionHandler: {(success: Bool) -> Void in
                    if success {
                      print("File overwrite OK")
                    } else {
                      print("File overwrite failed")
                    }
    })
  }
  // {{## END save ##}}
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let ukvs = NSUbiquitousKeyValueStore.default
    if let message = ukvs.string(forKey: "greeting-message") {
      print("Message was \(message)")
    }
    else {
      print("No message before now")
      ukvs.set("Hello", forKey: "greeting-message")
      if ukvs.synchronize() {
        print("UKVS saved")
      }
      else {
        print("UKVS not saved?!?")
      }
    }

    /*
    if let contents =
      try? FileManager.default.contentsOfDirectory(at: dirPaths[0],
                                                   includingPropertiesForKeys: nil,
                                                   options: .skipsHiddenFiles) {
      for c in contents {
        print(c)
      }
    }
    */
    

    // {{## BEGIN open ##}}
    let filemgr = FileManager.default
    let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
    documentURL = dirPaths[0].appendingPathComponent("savefile.txt")
    document = Document(fileURL: documentURL!)
    document!.userText = ""

    if filemgr.fileExists(atPath: (documentURL?.path)!) {
      document?.open(completionHandler: {(success: Bool) -> Void in
        if success {
          print("File open OK")
          self.textView.text = self.document?.userText
        } else {
          print("Failed to open file")
        }
      })
    }
    // {{## END open ##}}
    // {{## BEGIN create ##}}
    else {
      document?.save(to: documentURL!, for: .forCreating,
                     completionHandler: {(success: Bool) -> Void in
                      if success {
                        print("File created OK")
                      } else {
                        print("Failed to create file ")
                      }
      })
    }
    // {{## END create ##}}
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

