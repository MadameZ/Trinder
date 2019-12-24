//
//  HistoryViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 13/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
     var selectedImage: UIImage?
        var nameTrash: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.collectionView.dataSource = self
            self.collectionView.delegate = self
        }
          
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "Segue" {
                let nextVC = segue.destination as! HistoryDetailViewController
                if let image = selectedImage {
                    nextVC.imagePassed = image
                 
                }
            }
        }
    }

    // MARK:- collectionView's methods

    extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Reuse", for: indexPath) as! HistoryReusableView
         
            switch indexPath.section {
            case 0:
                headerView.titleSectionLabel.text = Object.houseTrash.name
                headerView.iconTrash.image = Object.houseTrash.icon
    //            headerView.lineView.backgroundColor = .brown
            case 1:
                headerView.titleSectionLabel.text = Object.recycleTrash.name
                headerView.iconTrash.image = Object.recycleTrash.icon
    //            headerView.lineView.backgroundColor = .yellow
             
            case 2:
                headerView.titleSectionLabel.text = Object.glassTrash.name
                headerView.iconTrash.image = Object.glassTrash.icon
    //            headerView.lineView.backgroundColor = .green
               
            case 3:
                headerView.titleSectionLabel.text = Object.dechetery.name
                headerView.iconTrash.image = Object.dechetery.icon
    //            headerView.lineView.backgroundColor = .purple
              
            default:
                break
            }

            return headerView
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return self.sections.count
            return 4
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //         return self.itemsInSections[section].count
            switch section {
            case 0:
                return Object.houseTrash.imageObject.count
            case 1:
                return Object.recycleTrash.imageObject.count
            case 2:
                return Object.glassTrash.imageObject.count
            case 3:
                return Object.dechetery.imageObject.count
            default:
               return 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HistoryCollectionViewCell

            switch indexPath.section {
            case 0:
                cell.mainImageVIew.image = Object.houseTrash.imageObject[indexPath.row]
            case 1:
                cell.mainImageVIew.image = Object.recycleTrash.imageObject[indexPath.row]
            case 2:
                cell.mainImageVIew.image = Object.glassTrash.imageObject[indexPath.row]
            case 3:
                cell.mainImageVIew.image = Object.dechetery.imageObject[indexPath.row]
            default:
                break
            }
           
            return cell
        }
        
     
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let cell = collectionView.cellForItem(at: indexPath) as! HistoryCollectionViewCell
            
            selectedImage =  cell.mainImageVIew.image
        
            self.performSegue(withIdentifier: "Segue", sender: nil)
      
        }
        
        

    }











