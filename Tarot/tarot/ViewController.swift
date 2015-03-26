//
//  ViewController.swift
//  Tarot
//
//  Created by Lucas Rocali Assuncao Assis on 6/03/2015.
//  Copyright (c) 2015 Lucas Rocali Assuncao Assis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel?
    
    @IBOutlet weak var imgCard: UIImageView!
    
    
    // Property referencing the model for managing data and business logic
    var model = Model()
    
    // Respond to the user clicking a button by providing advice from the oracle
    @IBAction func askTheOracle(sender: UIButton)
    {
        //Retrive a random message from the oracle
        lblAnswers?.text = model.respond();
        
        let description = model.currentCard.getCardDescription()
        //let description = model.getDesc()
        
        //Change the image in the UIImageView to the currently selected card
        imgCard.image = UIImage(named:model.currentCard.imageName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

