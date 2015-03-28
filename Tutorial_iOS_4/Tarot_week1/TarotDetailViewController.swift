//
//  TarotDetailViewController.swift
//  tarot_week1
//
//  Created by Mateus Cirolini on 28/03/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit
import Foundation

class TarotDetailViewController: UIViewController {

    var cardName:String?
    
    @IBOutlet weak var image:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named:cardName! + ".jpg")
        println()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
