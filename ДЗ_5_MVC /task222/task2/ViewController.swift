//
//  ViewController.swift
//  task2
//
//  Created by Сергей Клементьев on 09/07/2017.
//  Copyright © 2017 Сергей Клементьев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "TEXT"
    }
    
    @IBAction func showTime() {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        label1.text = formatter.string(from: currentDateTime)
}
}
