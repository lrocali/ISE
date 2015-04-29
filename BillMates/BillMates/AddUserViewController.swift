//
//  AddUserViewController.swift
//  BillMates
//
//  Created by Lucas Rocali on 4/26/15.
//  Copyright (c) 2015 Lucas Rocali. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var model = Model.sharedInstance
    
    @IBOutlet weak var addedUsersTableView: UITableView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBAction func buttonAddUser(sender: UIButton) {
        if !model.isTotallyEmpty(txtName.text) {
            model.saveUser(name:txtName.text)
            txtName.text = ""
            self.view.endEditing(true)
            self.addedUsersTableView.reloadData()
            txtName.text = ""
        }
    }
    
    @IBAction func buttonDeleteUser(sender: UIButton) {
        model.deleteUser(txtName.text)
        self.addedUsersTableView.reloadData()
        self.view.endEditing(true)
        txtName.text = ""
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("addedUsersCell", forIndexPath: indexPath) as! UITableViewCell
        
        let user = model.getUser(indexPath.row)
        cell.textLabel!.text = user.attName
        
        let userName = user.attName
        
        return cell
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getUsers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
