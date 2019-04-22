//
//  Task.swift
//  S06-TaskListApp
//
//  Created by Humberto Vieira on 22/04/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
