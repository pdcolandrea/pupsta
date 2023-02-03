//
//  HomeViewModel.swift
//  Pupsta
//
//  Created by Paul  Colandrea on 2/2/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var fetched_puppies: [Pup] = []
    
    @Published var displaying_pup: [Pup]?
    
    init() {
        fetched_puppies = [
            Pup(name: "Pauly", place: "home", profilePic: "pupz1"),
            Pup(name: "Not Pauly", place: "other home", profilePic: "pupz2")
        ]
        
    }
}
