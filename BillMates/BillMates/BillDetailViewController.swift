//
//  BillDetailViewController.swift
//  BillMates
//
//  Created by Lucas Rocali on 4/26/15.
//  Copyright (c) 2015 Lucas Rocali. All rights reserved.
//

import UIKit

class BillDetailViewController: UIViewController {

    var model = Model.sharedInstance
    
    var billCellIndex: Int?
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblBillOwner: UILabel!
    @IBOutlet weak var lblBillUsers: UILabel!
    override func viewDidLoad() {
        //model.getBills()
        //model.getUsers()
        super.viewDidLoad()
        //println(billCellIndex!)
        var bill = model.getBill(billCellIndex!)
        //println(bill.getBillOwner().attName)
        
        lblDescription.text = bill.getDescrition()
        lblValue.text = bill.getValue()
        lblBillOwner.text = bill.getBillOwner().attName
        var users = bill.getBillUsers()
        var usersNames:String = ""
        for user in users {
            usersNames = usersNames + user.attName + " - "
        }
        lblBillUsers.text = usersNames
        /*for user in ([User])users {
            println(user.attName)
        }*/
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
