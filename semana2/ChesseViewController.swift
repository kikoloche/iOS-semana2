//
//  ChesseViewController.swift
//  semana2
//
//  Created by Jose Rubio Fernandez on 06/03/16.
//  Copyright © 2016 My Company. All rights reserved.
//

import UIKit

class ChesseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var chessePicker: UIPickerView!
    
    var parent: NavViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.chessePicker.delegate = self
        self.chessePicker.dataSource = self
        parent =  self.parentViewController as! NavViewController
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parent.chesses.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parent.chesses[row]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.chessePicker.selectRow(parent.chesseIndex, inComponent: 0, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        parent.chesseIndex = self.chessePicker.selectedRowInComponent(0)
    }

}
