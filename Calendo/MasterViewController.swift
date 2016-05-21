//
//  MasterViewController.swift
//  Calendo
//
//  Created by Michael Mecham on 5/14/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    private let kMargin = CGFloat(0.0)
    
    var currentDay: Dia?
    var centerIndexPath: NSIndexPath?
    var firstDeselect: Bool = false
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredStatusBarStyle()
        monthLabel.text = NSDate().stringValueMonth()
        flowLayout.sectionInset = UIEdgeInsetsMake(0, kMargin, 0, kMargin)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        myDatePicker.minimumDate = NSDate()
        myDatePicker.maximumDate = NSDate(timeIntervalSinceNow: 172800)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let centerPoint = CGPointMake(myCollectionView.layer.frame.width / 2, myCollectionView.layer.frame.height / 2)
        if let indexPath = myCollectionView.indexPathForItemAtPoint(centerPoint) {
            self.centerIndexPath = indexPath
            self.collectionView(myCollectionView, didSelectItemAtIndexPath: indexPath)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action Buttons
    
    @IBAction func addTaskButtonTapped(sender: AnyObject) {
        newTaskAlert()
    }
    
    // MARK: - Alert Controller
    
    func newTaskAlert() {
        let alertController = UIAlertController(title: "Add New Task", message: nil, preferredStyle: .Alert)
        let createAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            if let taskField: UITextField = alertController.textFields?[0] {
                let newTask = Task(name: taskField.text ?? "")
                if let _: UITextField = alertController.textFields?[1] {
                    newTask.dueDate = self.myDatePicker.date
                }
                DateController.sharedController.addTaskToDia(newTask, dia: self.currentDay ?? Dia(dia: NSDate()))
                self.myTableView.reloadData()
            }
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addTextFieldWithConfigurationHandler { (taskNameTextField) in
            taskNameTextField.placeholder = "Task Name"
        }
        alertController.addTextFieldWithConfigurationHandler { (dueDateTextField) in
            dueDateTextField.placeholder = "Due Date?"
            dueDateTextField.inputView = self.myDatePicker
        }
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
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

// MARK: - TableView Methods

extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDay?.tasks.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        cell.textLabel?.text = currentDay?.tasks[indexPath.row].name
        cell.textLabel?.text = currentDay?.tasks[indexPath.row].dueDate ?? ""
        return cell
    }
}

// MARK: - CollectionView Methods

extension MasterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollectionView.frame.width/5, height: self.myCollectionView.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DateController.sharedController.diaArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dateCell", forIndexPath: indexPath) as! DateCollectionViewCell
        let day = DateController.sharedController.diaArray[indexPath.item]
        cell.dateLabel.text = "\(day.day)"
        if day == Dia(dia: NSDate()) {
            cell.dateLabel.font = cell.dateLabel.font.fontWithSize(38)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! DateCollectionViewCell
        let dia = DateController.sharedController.diaArray[indexPath.row]
        currentDay = dia
        myTableView.reloadData()
        if indexPath.row != 2 && firstDeselect == false {
            firstDeselect = true
           self.collectionView(myCollectionView, didDeselectItemAtIndexPath: centerIndexPath ?? NSIndexPath())
        }
        cell.dateLabel.shadowColor = .yellowColor()
        cell.dateLabel.shadowOffset.height = 2
        cell.dateLabel.shadowOffset.width = 2
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! DateCollectionViewCell
        cell.dateLabel.shadowColor = .clearColor()
    }
}







































