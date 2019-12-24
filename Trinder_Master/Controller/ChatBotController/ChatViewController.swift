//
//  ChatViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 13/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let names = ["", "Textile", "Mobilier", "Electroménager", "Alimentaire", "Emballage", "Verre", "Végétal", "High-tech", "Medical"]
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var decheteryButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var namePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namePickerView.dataSource = self
        namePickerView.delegate = self
        addShadow()
//        isHidden()
    }


    
    func addShadow() {
        guard let view = backgroundView else { return }
//        view.layer.borderWidth = 1
//        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
    }
    
 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        let nameToDisplay = names[row]
        return nameToDisplay
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let typeChoice = names[row]
        
 
        if typeChoice == "Medical" {
            isNotHidden()
            iconImageView.image = #imageLiteral(resourceName: "pharmacy")
            firstLabel.text = "À déposer en pharmacie"
            secondLabel.text = "Tes médicaments périmés seront recyclés."
            thirdLabel.text = "Ne pas jetter dans la poubelle marron."
            decheteryButton.isHidden = true
        }else if typeChoice == "Textile"{
            isNotHidden()
            iconImageView.image = #imageLiteral(resourceName: "give")
            firstLabel.text = "Des enseignes comme H&M les reprennent."
            secondLabel.text = "Tu pourrais en faire une taie d'oreiller !"
            thirdLabel.text = "Dépose-le dans un conteneur textile."
            decheteryButton.isHidden = true
        }else if typeChoice == "Mobilier"{
            isNotHidden()
            iconImageView.image = #imageLiteral(resourceName: "give")
            firstLabel.text = "Peut-il servir à quelqu'un d'autre?"
            secondLabel.text = "Revend-le sur le bon coin."
            thirdLabel.text = "Bon, alors va à la déchetterie."
            decheteryButton.isHidden = false
        }else if typeChoice == "Electroménager"{
            isNotHidden()
            iconImageView.image = #imageLiteral(resourceName: "repair")
            firstLabel.text = "Peut-il servir à quelqu'un d'autre?"
            secondLabel.text = "Demande conseil pour le réparer?"
            thirdLabel.text = "Bon, alors va à la déchetterie"
            decheteryButton.isHidden = false
        }else if typeChoice == "Alimentaire"{
            isNotHidden()
            iconImageView.image = #imageLiteral(resourceName: "trash1")
            firstLabel.text = "Tu n'as pas terminé ton assiette?"
            secondLabel.text = "Ne le jette pas avec son emballage."
            thirdLabel.text = "Ça va dans la poubelle marron."
            decheteryButton.isHidden = true
        }else if typeChoice == "Emballage"{
            isNotHidden()
             iconImageView.image = #imageLiteral(resourceName: "trash2")
            firstLabel.text = "Peux-tu le réutiliser autrement?"
            secondLabel.text = "Est-il propre?"
            thirdLabel.text = "Ça va dans la poubelle jaune."
            decheteryButton.isHidden = true
        }else if typeChoice == "Verre"{
            isNotHidden()
             iconImageView.image = #imageLiteral(resourceName: "trash3")
            firstLabel.text = "Peux-tu le réutiliser en pot de confiture?"
            secondLabel.text = "Ne confond pas le verre et la porcelaine."
            thirdLabel.text = "Ça va dans poubelle blanche."
            decheteryButton.isHidden = true
        }else if typeChoice == "Végétal"{
            isNotHidden()
             iconImageView.image = #imageLiteral(resourceName: "trash5")
            firstLabel.text =  "Ne pas confondre les légumes avec les végétaux."
            secondLabel.text = "Les végétaux sont les plantes, fleurs, feuilles."
            thirdLabel.text = "Ça va dans poubelle blanche."
            decheteryButton.isHidden = true
        }else if typeChoice == "High-tech"{
            isNotHidden()
            iconImageView.image = #imageLiteral(resourceName: "give")
            firstLabel.text = "Peut-il servir à quelqu'un d'autre?"
            secondLabel.text = "Peux-tu le réparer?"
            thirdLabel.text = "Bon, alors va à la déchetterie"
            decheteryButton.isHidden = false
        }else{

            firstLabel.text = ""
            secondLabel.text = ""
            thirdLabel.text = ""
        }
    }
    
    func isNotHidden() {
        iconImageView.isHidden = false
        firstLabel.isHidden = false
        secondLabel.isHidden = false
        thirdLabel.isHidden = false
    }
    
    func isHidden() {
           iconImageView.isHidden = true
           firstLabel.isHidden = true
           secondLabel.isHidden = true
           thirdLabel.isHidden = true
       }

    
    @IBAction func didTapDecheteryButton(_ sender: Any) {
    }
    

}


