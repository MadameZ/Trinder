//
//  Object.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 13/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import Foundation
import UIKit

struct Object {
    var name: String
    var image: UIImage
    
    enum Style {
        case houseTrash, recycleTrash, glasstrash
    }
}

struct Poubelle {
    var name: String
    var icon: UIImage
    
}
