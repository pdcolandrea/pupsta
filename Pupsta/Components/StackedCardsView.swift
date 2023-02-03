//
//  StackedCardsView.swift
//  Pupsta
//
//  Created by Paul  Colandrea on 2/2/23.
//

import SwiftUI

struct StackedCardsView: View {
    @EnvironmentObject var vm: HomeViewModel
    var pup: Pup
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            Spacer()
            
            ZStack {
                Image(pup.profilePic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
            }
            
            Spacer()

        }
    }
}

struct StackedCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
