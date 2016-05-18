//
//  MasterViewController.swift
//  Calendo
//
//  Created by Michael Mecham on 5/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    private let kMargin = CGFloat(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredStatusBarStyle()
        
        monthLabel.text = NSDate().stringValue()
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, kMargin, 0, kMargin)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Action Buttons
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - TableView Methods

extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        return cell
    }
}

// MARK: - CollectionView Methods

extension MasterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollectionView.frame.width/5, height: self.myCollectionView.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DateController.sharedController.dateArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dateCell", forIndexPath: indexPath) as! DateCollectionViewCell
        let day = DateController.sharedController.dateArray[indexPath.item]
        cell.dateLabel.text = "\(day.day)"
        if day == Date(date: NSDate()) {
            cell.dateLabel.font = cell.dateLabel.font.fontWithSize(38)
            cell.dateLabel.shadowColor = .yellowColor()
            cell.dateLabel.shadowOffset.height = 2
            cell.dateLabel.shadowOffset.width = 2
            
//            cell.selectedDateView.hidden = false
//            cell.selectedDateView.layer.cornerRadius = min(cell.frame.width, cell.frame.height) / 2.0
        }
        return cell
    }
}



















