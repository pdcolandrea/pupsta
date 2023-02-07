//
//  Home.swift
//  Pupsta
//
//  Created by Paul  Colandrea on 2/2/23.
//

import SwiftUI

struct Home: View {
    @StateObject private var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(
                Text("pupsta").font(.title.bold())
            ).foregroundColor(.black)
                .padding()
            
            Spacer()
            
            // pupps
            ZStack {
                if let puppies = vm.displaying_pup {
                    if puppies.isEmpty {
                        Text("No puppies found :( ")
                            .font(.caption)
                            .foregroundColor(.gray)
                    } else {
                        // Reversed due to zstack
                        ForEach(puppies.reversed()) { p in
                            StackedCardsView(pup: p)
                                .environmentObject(vm)
                        }
                    }
                } else {
                    ProgressView()
                }
            }.padding(.top, 30).padding().padding(.vertical)
            
            // could be wrong vv
            Spacer()
            
            // action buttons
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image("dog-icon")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 5)
                        .clipShape(Circle())
                    
                }
                
                Spacer()

                Button {
                    
                } label: {
                    Image(systemName: "trophy.fill").font(.system(size: 25))
                        .foregroundColor(.black)
//                        .shadow(radius: 5)
                }
                
            }.padding(.bottom).padding(.horizontal, 30)
            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
