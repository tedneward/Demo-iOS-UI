//
//  ViewController.swift
//  TableFun
//
//  Created by Ted Neward on 3/5/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var tblTable: UITableView!
    
    let stringTableData = StringTableDataModel([
        "Arizona Cardinals",
        "Atlanta Falcons",
        "Carolina Panthers",
        "Chicago Bears",
        "Dallas Cowboys",
        "Detroit Lions",
        "Green Bay Packers",
        "Los Angeles Rams",
        "Minnesota Vikings",
        "New Orleans Saints",
        "New York Giants",
        "Philadelphia Eagles",
        "San Francisco 49ers",
        "Seattle Seahawks",
        "Tampa Bay Buccaneers",
        "Washington Commanders",
    ])

    class StringTableDataModel : NSObject, UITableViewDataSource {
        let data : [String]
        init(_ items : [String]) {
            data = items
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StringCell")!
            cell.textLabel?.text = data[indexPath.row]
            return cell
        }
    }
    
    class NFLDataModel : NSObject, UITableViewDataSource {
        let league : [String: [String]] = [
            "AFC East" : [ "Buffalo Bills", "Miami Dolphins", "New England Patriots", "New York Jets" ],
            "AFC North": [ "Baltimore Ravens", "Cleveland Browns", "Cincinnati Bengals", "Pittsburgh Steelers" ],
            "AFC South": [ "Houston Texans", "Tennessee Titans", "Jacksonville Jaguars", "Indianapolis Colts" ],
            "AFC West" : [ "Los Angeles Chargers", "Las Vegas Raiders", "Kansas City Chiefs", "Denver Broncos" ],
            "NFC East" : [ "A", "B", "C", "D" ],
            "NFC North": [ "A", "B", "C", "D" ],
            "NFC South": [ "A", "B", "C", "D" ],
            "NFC West" : [ "A", "B", "C", "D" ]
        ]
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return league.keys.count
        }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return (Array(league.keys))[section]
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 4  // Every division has four teams in it
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StringCell")!
            let division = (Array(league.keys))[indexPath.section]
            let team = league[division]?[indexPath.row]
            cell.textLabel?.text = team
            return cell
        }
    }
    let nflTableData = NFLDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblTable.dataSource = nflTableData //stringTableData
        tblTable.delegate = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("User selected \(indexPath)")
        let alert = UIAlertController(title: "You selected", message: indexPath.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Close the alert"), style: .default, handler: { _ in
            NSLog("User said OK.")
            alert.dismiss(animated: true)
        }))
        self.present(alert, animated: true)
    }

}

