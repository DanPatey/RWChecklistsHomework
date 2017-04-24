//
//  CheckListItem.swift
//  Checklists
//
//  Created by Dan Patey on 4/19/17.
//  Copyright © 2017 Dan Patey. All rights reserved.
//

import Foundation

class CheckListItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecker() {
        checked = !checked
    }
}
