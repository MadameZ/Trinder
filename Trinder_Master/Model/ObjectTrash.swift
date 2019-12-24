//
//  ObjectTrash.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 13/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import Foundation
import UIKit


struct Object {
    
    var id: Int
    var name: String
    var imageObject: [UIImage]
    var icon: UIImage
    

    static let houseTrash = Object(id: 1, name: "Déchet alimentaire", imageObject: [#imageLiteral(resourceName: "house4"), #imageLiteral(resourceName: "house1"), #imageLiteral(resourceName: "house2"), #imageLiteral(resourceName: "house5"), #imageLiteral(resourceName: "house6")], icon: #imageLiteral(resourceName: "trash1"))
    static let recycleTrash = Object(id : 2, name: "Déchet recyclable", imageObject: [#imageLiteral(resourceName: "recycle1"), #imageLiteral(resourceName: "recycle2"), #imageLiteral(resourceName: "recycle4"), #imageLiteral(resourceName: "recycle5"), #imageLiteral(resourceName: "recycle6")], icon: #imageLiteral(resourceName: "trash2"))
    static let glassTrash = Object(id: 3, name: "Déchet en verre", imageObject: [#imageLiteral(resourceName: "glass1"), #imageLiteral(resourceName: "glass2"), #imageLiteral(resourceName: "glass3"), #imageLiteral(resourceName: "glass4")], icon: #imageLiteral(resourceName: "trash3"))
    static let dechetery = Object(id: 4, name: "Déchet en déchetterie", imageObject: [#imageLiteral(resourceName: "dechetery4"), #imageLiteral(resourceName: "dechetery3"), #imageLiteral(resourceName: "dechetery2"), #imageLiteral(resourceName: "dechetery5")], icon: #imageLiteral(resourceName: "trash4"))
}

struct Card {
    
    var name: String
    var image: UIImage
    var idPoubelle: Int
    var description: String
    var icon: UIImage
    
    static let cards: [Card] = [
        Card(name: "viande", image: #imageLiteral(resourceName: "house4"), idPoubelle: 1, description: Message.infoHouseTrash, icon:#imageLiteral(resourceName: "trash1")),
        Card(name: "légumes", image: #imageLiteral(resourceName: "house5"), idPoubelle: 1, description: Message.infoHouseTrash, icon:#imageLiteral(resourceName: "trash1")),
        Card(name: "pomme", image: #imageLiteral(resourceName: "house6"), idPoubelle: 1, description: Message.infoHouseTrash, icon:#imageLiteral(resourceName: "trash1")),
        Card(name: "ananas", image: #imageLiteral(resourceName: "house1"), idPoubelle: 1, description: Message.infoHouseTrash, icon: #imageLiteral(resourceName: "trash1")),
        Card(name: "amazon", image: #imageLiteral(resourceName: "recycle1"), idPoubelle: 2, description: Message.infoRecycleTrash, icon: #imageLiteral(resourceName: "trash2")),
        Card(name: "paper", image: #imageLiteral(resourceName: "recycle4"), idPoubelle: 2, description: Message.infoRecycleTrash, icon: #imageLiteral(resourceName: "trash2")),
        Card(name: "carton", image: #imageLiteral(resourceName: "recycle5"), idPoubelle: 2, description: Message.infoRecycleTrash, icon: #imageLiteral(resourceName: "trash2")),
        Card(name: "cornBox", image: #imageLiteral(resourceName: "recycle2"), idPoubelle: 2, description: Message.infoRecycleTrash, icon: #imageLiteral(resourceName: "trash2")),
        Card(name: "plastiqueBottle", image: #imageLiteral(resourceName: "recycle6"), idPoubelle: 2, description: Message.infoRecycleTrash, icon: #imageLiteral(resourceName: "trash2")),
        Card(name: "wine", image: #imageLiteral(resourceName: "glass1"), idPoubelle: 3, description: Message.infoGlassTrash, icon: #imageLiteral(resourceName: "trash3")) ,
        Card(name: "glass", image: #imageLiteral(resourceName: "glass2"), idPoubelle: 3, description: Message.infoGlassTrash, icon: #imageLiteral(resourceName: "trash3")),
        Card(name: "biere", image: #imageLiteral(resourceName: "glass4"), idPoubelle: 3, description: Message.infoGlassTrash, icon: #imageLiteral(resourceName: "trash3")),
        Card(name: "dechetery", image: #imageLiteral(resourceName: "dechetery4"), idPoubelle: 4, description: Message.infoDechetery, icon: #imageLiteral(resourceName: "trash4")),
        Card(name: "dechetery", image: #imageLiteral(resourceName: "dechetery1"), idPoubelle: 4, description: Message.infoDechetery, icon: #imageLiteral(resourceName: "trash4")),
        Card(name: "dechetery", image: #imageLiteral(resourceName: "dechetery2"), idPoubelle: 4, description: Message.infoDechetery, icon: #imageLiteral(resourceName: "trash4")),
        Card(name: "dechetery", image: #imageLiteral(resourceName: "dechetery5"), idPoubelle: 4, description: Message.infoDechetery, icon: #imageLiteral(resourceName: "trash4"))
    ]
}






