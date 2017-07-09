//
//  DescriptionViewController.swift
//  BrandUITableViewController
//
//  Created by Сергей Клементьев on 07/07/2017.
//  Copyright © 2017 Сергей Клементьев. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    var brandNumberToShow: Int?
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var descr: UILabel!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()


 //       descr.text = brand?.descr
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let brNumb = brandNumberToShow {
            let brand = brands[brNumb]
            img.image = brand.image
            brandName.text = brand.name
            descr.text = brand.descr
        } else {
            brandName.text = "WTF"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
