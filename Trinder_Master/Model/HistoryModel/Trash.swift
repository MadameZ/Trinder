//
//  Trash.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 13/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import Foundation
import UIKit

struct Object {
    var name: String
    var imageObject: [UIImage]
    var icon: UIImage
   
    
    static let houseTrash = Object(name: "House trash", imageObject: [#imageLiteral(resourceName: "house2"), #imageLiteral(resourceName: "house4"), #imageLiteral(resourceName: "house1")], icon: #imageLiteral(resourceName: "trashBrown"))
    static let recycleTrash = Object(name: "Recycle trash", imageObject: [#imageLiteral(resourceName: "recycle4"), #imageLiteral(resourceName: "recycle1"), #imageLiteral(resourceName: "recycle3"), #imageLiteral(resourceName: "recycle2")], icon: #imageLiteral(resourceName: "trashYellow"))
    static let glassTrash = Object(name: "Glass Trash", imageObject: [#imageLiteral(resourceName: "glass2"), #imageLiteral(resourceName: "glass1"), #imageLiteral(resourceName: "glass3")], icon: #imageLiteral(resourceName: "trashWhite"))
    static let dechetery = Object(name: "dechetery", imageObject: [#imageLiteral(resourceName: "dechetery2"), #imageLiteral(resourceName: "dechetery1"), #imageLiteral(resourceName: "dechetery4")], icon: #imageLiteral(resourceName: "traskTruck"))
    
    
    
}

class Question {
    
    let trashDict : [String: UIImage] = ["houseTrash": #imageLiteral(resourceName: "house1"), "houseTrash": #imageLiteral(resourceName: "house3"), "houseTrash": #imageLiteral(resourceName: "house2"), "recycleTrash": #imageLiteral(resourceName: "recycle1"), "recycleTrash": #imageLiteral(resourceName: "recycle4"), "recycleTrash": #imageLiteral(resourceName: "recycle2"), "glassTrash": #imageLiteral(resourceName: "glass3"), "glassTrash": #imageLiteral(resourceName: "glass2"), "glassTrash": #imageLiteral(resourceName: "glass1")]
    
    var isGoodAnswer: Bool = false
    var image: UIImage!
    var icon: UIImage!
    
    enum Answer {
        case goodAnswer, badAnswer
    }
    
    enum Trash {
        case houseTrash, recycleTrash, glassTrash
    }
    
    func getQuestion(_ question: Trash)  {
        switch question {
        case .houseTrash:
            image = trashDict["houseTrash"]
            icon = #imageLiteral(resourceName: "trashBrown")
        case .recycleTrash:
            image = trashDict["recycleTrash"]
            icon = #imageLiteral(resourceName: "trashYellow")
        case .glassTrash:
            image = trashDict["glassTrash"]
            icon = #imageLiteral(resourceName: "trashWhite")

        }
    }
    


}









