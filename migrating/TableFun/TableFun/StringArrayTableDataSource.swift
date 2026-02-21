//
//  StringArrayTableDataSource.swift
//  TableFun
//
//  Created by Ted Neward on 5/3/22.
//

import Foundation
import UIKit

class StringArrayTableDataSource : NSObject, UITableViewDataSource {
    
    var data : [String] = []
    var cellFunc : (IndexPath, String) -> UITableViewCell
    
    init(_ strings: [String], cellAcquisitionFunction cf : @escaping (IndexPath, String) -> UITableViewCell) {
        data = strings
        cellFunc = cf
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellFunc(indexPath, data[indexPath.row])
    }
}

class GenericTableDataSource<T> : NSObject, UITableViewDataSource {
    var data : [T] = []
    var cellFunc : (IndexPath, T) -> UITableViewCell
    
    init(_ ts: [T], cellAcquisitionFunction cf : @escaping (IndexPath, T) -> UITableViewCell) {
        data = ts
        cellFunc = cf
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellFunc(indexPath, data[indexPath.row])
    }
}
