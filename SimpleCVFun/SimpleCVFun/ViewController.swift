//
//  ViewController.swift
//  SimpleCVFun
//
//  Created by Ted Neward on 10/27/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import UIKit

// {{## BEGIN collviewviewcontroller ##}}
class ViewController: UICollectionViewController {
// {{## END collviewviewcontroller ##}}

    // {{## BEGIN inits ##}}
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        collectionView?.register(UICollectionViewCell.classForCoder(),
                                 forCellWithReuseIdentifier: "cell")
        collectionView?.backgroundColor = UIColor.white
    }
    convenience required init(coder aDecoder: NSCoder) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 80, height: 80)
        flowLayout.scrollDirection = .vertical
        self.init(collectionViewLayout: flowLayout)
    }
    // {{## END inits ##}}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // {{## BEGIN numberOfSections ##}}
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // {{## END numberOfSections ##}}

    // {{## BEGIN numberOfItemsInSection ##}}
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(21) + 20)
    }
    // {{## END numberOfItemsInSection ##}}

    // {{## BEGIN cellForItemAt ##}}
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath)
                as UICollectionViewCell
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label.text = indexPath.item.description
        label.textAlignment = .center
        cell.contentView.addSubview(label)

        cell.backgroundColor = UIColor.cyan
        
        return cell
    }
    // {{## END cellForItemAt ##}}
    
    // {{## BEGIN didSelectItemAt ##}}
    override public func collectionView(_ collectionView: UICollectionView,
                                        didSelectItemAt indexPath: IndexPath) {
        let alertVC = UIAlertController(title: "You selected",
                                        message: "Item \(indexPath)",
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            alertVC.dismiss(animated: true)
        })
        self.present(alertVC, animated: true)
    }
    // {{## END didSelectItemAt ##}}
}

