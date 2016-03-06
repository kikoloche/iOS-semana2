//
//  ConfirmViewController.swift
//  semana2
//
//  Created by Jose Rubio Fernandez on 06/03/16.
//  Copyright © 2016 My Company. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var chesseLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    var parent: NavViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        parent =  self.parentViewController as! NavViewController
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.sizeLabel.text=parent.sizes[parent.sizeIndex];
        self.massLabel.text=parent.masses[parent.massIndex];
        self.chesseLabel.text=parent.chesses[parent.chesseIndex];
        
        var s=""
        for i in parent.ingredientsIndexes {
            s = s + parent.ingredients[i] + " "
        }
        
        self.ingredientsLabel.text=s
        self.ingredientsLabel.numberOfLines=0
        self.ingredientsLabel.sizeToFit()
    }
        
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }


}
