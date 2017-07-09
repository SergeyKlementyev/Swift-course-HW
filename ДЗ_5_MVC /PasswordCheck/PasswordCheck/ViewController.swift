//
//  ViewController.swift
//  PasswordCheck
//
//  Created by Сергей Клементьев on 05/07/2017.
//  Copyright © 2017 Сергей Клементьев. All rights reserved.
//

import UIKit
var check = false

class UIStoryboardSeguee : UIStoryboardSegue {
    override func perform() {
        if check == false {
            return
        }
        super.perform()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPushed() {
        if loginTextField.text == "vasa" && passwordTextField.text == "123456" {
            label.text = "УСПЕШНО"
            check = true 
        } else {
            label.textColor = UIColor(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)
            label.text = "Ошибка ввода"
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        check = false
        super.viewDidAppear(animated)
    }

}

