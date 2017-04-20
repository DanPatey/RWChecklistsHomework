//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Dan Patey on 4/20/17.
//  Copyright © 2017 Dan Patey. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)    
    }
}
