//
//  Brand.swift
//  Brand1
//
//  Created by Сергей Клементьев on 06/07/2017.
//  Copyright © 2017 Сергей Клементьев. All rights reserved.
//

import Foundation
import UIKit

class Brand {
    var name: String
    var descr: String
    var image: UIImage?
    init(name: String, imageName: String, descr: String) {
        self.name = name
        self.descr = descr
        self.image = UIImage(named: imageName)
    }
}

var brands = [Brand(name: "Coca cola", imageName: "cola",descr: "blablabla blablablabla bla"),Brand(name: "Pringles", imageName: "pringles", descr: "blablabla blablablabla bla"),Brand(name: "Kia", imageName: "kia", descr: "blablabla blablablabla bla"),Brand(name: "Sumsung", imageName: "sumsung", descr: "blablabla blablablabla bla"),Brand(name: "Canon", imageName: "canon", descr: "blablabla blablablabla bla")]
