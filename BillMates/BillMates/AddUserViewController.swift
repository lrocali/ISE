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
    
//    @IBOutlet weak var addUserContactImage: UIImageView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of cells
        return model.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("addedUsersCell", forIndexPath: indexPath) as! UITableViewCell
        
        let userName = model.getUser(indexPath.row).attName
        var userImage : UIImage = UIImage(named: "blankContact.jpg")!
        
        if ((UIImage(named: userName + ".jpg")) != nil) {
            println("Achou Imagem")
            userImage = UIImage(named: userName + ".jpg")!
        }
        
        cell.imageView!.image = userImageq q q
        cell.textLabel!.text = userName
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
