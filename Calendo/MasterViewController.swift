//
//  MasterViewController.swift
//  Calendo
//
//  Created by Michael Mecham on 5/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    
    var daysArray = NSDate().formatDate()
    let currentDate = Date(date: NSDate())
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthLabel.text = NSDate().stringValue()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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

extension MasterViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dateCell", forIndexPath: indexPath) as! DateCollectionViewCell
        let day = daysArray[indexPath.item]
        cell.dateLabel.text = "\(day)"
        return cell
    }
    
}