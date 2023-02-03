//
//  Pup.swift
//  Pupsta
//
//  Created by Paul  Colandrea on 2/2/23.
//

import SwiftUI

struct Pup: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var place: String
    var profilePic: String
}
