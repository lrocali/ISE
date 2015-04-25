//
//  AddUserViewController.swift
//  BillMates
//
//  Created by Lucas Rocali on 4/26/15.
//  Copyright (c) 2015 Lucas Rocali. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {

    var model = Model.sharedInstance
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBAction func buttonAddUser(sender: UIButton) {
        model.saveUser(name:txtName.text)
        txtName.text = ""
    }
    @IBAction func buttonDeleteUser(sender: UIButton) {
        model.deleteUser(txtName.text)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
