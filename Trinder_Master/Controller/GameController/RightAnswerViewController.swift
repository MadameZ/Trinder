//
//  RightAnswerViewController.swift
//  Trinder_Master
//
//  Created by HomeSweetHome on 16/12/2019.
//  Copyright © 2019 carolinezaini. All rights reserved.
//

import UIKit

class RightAnswerViewController: UIViewController {

    var descriptionText = ""
    
    @IBOutlet weak var descriptionRightAnswerView: UITextView!
    @IBOutlet weak var textDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDescriptionLabel.text = descriptionText
    }
    


}
