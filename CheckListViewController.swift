//
//  CheckListViewController.swift
//  Checklists
//
//  Created by Dan Patey on 4/19/17.
//  Copyright © 2017 Dan Patey. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    var items: [CheckListItem]
    
    @IBAction func AddItem(_ sender: Any) {
        let item = CheckListItem()
        item.text = "I am a new item"
        item.checked = false
        let newRowIndex = items.count
        
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    required init?(coder aDecoder: NSCoder) {
        items = [CheckListItem]()
        
        let row0item = CheckListItem()
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = CheckListItem()
        row1item.text = "Brush My Teeth"
        row1item.checked = true
        items.append(row1item)

        let row2item = CheckListItem()
        row2item.text = "Learn iOS Development"
        row2item.checked = true
        items.append(row2item)

        let row3item = CheckListItem()
        row3item.text = "Soccer Practice"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = CheckListItem()
        row4item.text = "Eat Ice Cream"
        row4item.checked = true
        items.append(row4item)

        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        
        return cell
    }
    
    func configureText(for cell:UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecker()
            configureCheckMark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
