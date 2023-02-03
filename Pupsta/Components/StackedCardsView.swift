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
            
            let index = CGFloat(vm.getIndex(pup: pup))
            let tOffset = (index <= 2 ? index : 2) * 15
            
            ZStack {
                Image(pup.profilePic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width - tOffset, height: size.height)
                    .cornerRadius(15)
                    .offset(y: -tOffset)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

        }
    }
}

struct StackedCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
