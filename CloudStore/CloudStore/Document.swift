//
//  Document.swift
//  CloudStore
//
//  Created by Ted Neward on 11/18/17.
//  Copyright © 2017 Ted Neward. All rights reserved.
//

import UIKit

// {{## BEGIN document ##}}
class Document: UIDocument {
  var userText : String? = "Some sample text"
  
  override func contents(forType typeName: String) throws -> Any {
    if userText == nil {
      userText = ""
    }
    let data = userText?.data(using: .utf16)
    return data as Any
  }
  
  override func load(fromContents contents: Any, ofType typeName: String?) throws {
    if let userContent = contents as? Data {
      userText = String(data: userContent, encoding: .utf16)
    }
  }
}
// {{## END document ##}}
