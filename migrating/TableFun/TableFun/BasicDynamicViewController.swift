//
//  ViewController.swift
//  TableFun
//
//  Created by Ted Neward on 4/26/22.
//

import UIKit

class BasicDynamicViewController: UIViewController, UITableViewDelegate {
    
    var dataSource : GenericTableDataSource<String>!
    
    @IBOutlet weak var tableView: UITableView!
    func prepareCell(_ indexPath : IndexPath, _ data : String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dwarfBasicCell")
        cell?.textLabel?.text = data
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        dataSource = GenericTableDataSource(["Thorin Oakenshield",
                                             "Balin", "Dwalin",
                                             "Kili", "Fili",
                                             "Dori", "Ori", "Nori",
                                             "Gloin", "Oin",
                                             "Bifur", "Bofur",
                                             "Bombur",
                                             "Gimli"],
                                            cellAcquisitionFunction: prepareCell)
        
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    @IBAction func onDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Selected!",
                                      message: "You selected \(dataSource.data[indexPath.row])",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alert, sender: self)
    }

}

