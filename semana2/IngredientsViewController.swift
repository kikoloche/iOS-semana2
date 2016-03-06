//
//  IngredientsViewController.swift
//  semana2
//
//  Created by Jose Rubio Fernandez on 06/03/16.
//  Copyright © 2016 My Company. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var sigButton: UIBarButtonItem!
    
    var parent: NavViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        self.ingredientsTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        parent =  self.parentViewController as! NavViewController

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for i in self.parent.ingredientsIndexes {
            let ip:NSIndexPath = NSIndexPath(forRow: i, inSection: 0)
            self.ingredientsTable.selectRowAtIndexPath(ip, animated: false, scrollPosition: UITableViewScrollPosition.None)
        }
        self.sigButton.enabled = (self.parent.ingredientsIndexes.count>0)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let a = self.ingredientsTable.indexPathsForSelectedRows {
            self.parent.ingredientsIndexes=[]
            for i in a {
                self.parent.ingredientsIndexes.append(i.row)
            }
        }
    }

    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parent.ingredients.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.ingredientsTable.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = parent.ingredients[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if let a = self.ingredientsTable.indexPathsForSelectedRows{
            if a.count>4 {
                let alert = UIAlertController(title: "Aviso:", message: "Solo se pueden seleccionar hasta cinco ingredientes.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return nil
            } else {
                return indexPath
            }

        } else {
            return indexPath
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.sigButton.enabled = true
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let a = self.ingredientsTable.indexPathsForSelectedRows{
            self.sigButton.enabled = (a.count>0)
        } else {
            self.sigButton.enabled = false
        }
    }

}
