//
//  ViewController.swift
//  CustomCalender
//
//  Created by Sumaira Nazir on 17/04/2018.
//  Copyright © 2018 Sumaira Nazir. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
	var calenderItems:[String] = []
    var items = ["1", "2", "3", "4", "5", "6", "7",
                 "8", "9", "10", "11", "12", "13", "14",
                 "15", "16", "17", "18", "19", "20", "21",
                 "22", "23", "24", "25", "26", "27", "28",
                 "29", "30", "31", "32", "33", "34", "35"]
    
     let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    @IBOutlet weak var  collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
		showCalenderDays(index: 1)
		Calendar.in
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
          return 7
        }
        return self.calenderItems.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        if indexPath.section == 0 {
            cell.myLabel.text = self.days[indexPath.item]
        }else {
			if calenderItems[indexPath.item] == "@" {
				cell.contentView.isHidden = true
				cell.layer.borderColor = UIColor.white.cgColor

			}else {
				cell.myLabel.text = self.calenderItems[indexPath.item]
				cell.backgroundColor = UIColor.cyan
				cell.contentView.isHidden = false
				cell.layer.borderColor = UIColor.black.cgColor //Set Default color here
			}
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
       // print("You selected cell #\(indexPath.item)!")
		showCalenderDays(index: Int32(indexPath.item))
    }
    
    func showCalenderDays(index: Int32) {
        //collectionView.
		calenderItems.removeAll()
		for i in 0..<items.count {
			if i < index || i > 29{
				calenderItems.append("@")
			}else {
				calenderItems.append(items[i])
			}
		}
		collectionView.reloadData()
    }
    


}

