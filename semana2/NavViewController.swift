//
//  NavViewController.swift
//  semana2
//
//  Created by Jose Rubio Fernandez on 06/03/16.
//  Copyright © 2016 My Company. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {
    
    var sizeIndex: Int = 0
    let sizes: [String] = ["Chica", "Mediana", "Grande"]
    
    var massIndex: Int = 0
    let masses: [String] = ["Delgada", "Crujiente", "Gruesa"]

    var chesseIndex: Int=0
    let chesses: [String] = ["Mozarella", "Cheddar", "Parmesano", "Sin queso"]
    
    var ingredientsIndexes:[Int] = []
    let ingredients: [String] = ["Jamon", "Pepperini", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
