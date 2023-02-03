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
            Pup(name: "Pauly", place: "home", profilePic: "dog2"),
            Pup(name: "Not Pauly", place: "other home", profilePic: "dog2"),
            Pup(name: "Not Psa", place: "other home1", profilePic: "dog2"),
            Pup(name: "Not Piwea", place: "other home2", profilePic: "dog2")
        ]
        
        displaying_pup = fetched_puppies
    }
    
    func getIndex(pup: Pup) -> Int {
        let index = displaying_pup?.firstIndex(where: { currentPup in
            return pup.id == currentPup.id
        }) ?? 0
        
        return index
    }
}
