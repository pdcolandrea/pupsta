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
    
    @State private var xOffset: CGFloat = 0
    @State private var endSwipe: Bool = false
    @GestureState private var isDragged: Bool = false
    
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            let index = CGFloat(vm.getIndex(pup: pup))
            let tOffset = (index <= 2 ? index : 2) * 15
            
            ZStack {
                Image(pup.profilePic)
                    .resizable()
                    .frame(width: size.width - tOffset, height: size.height)
                    .cornerRadius(15)
                    .offset(y: -tOffset)
                VStack {
                    Text(pup.name)
                    Text(pup.place)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading).padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

        }
        .offset(x: xOffset)
        .rotationEffect(.init(degrees: getRotation(angle: 8)))
        .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
            .gesture(
                DragGesture()
                    .updating($isDragged, body: { value, out, _ in
                    out = true
                })
                    .onChanged({value in
                        let translation = value.translation.width
                        xOffset = (isDragged ? translation : .zero )
                    })
                    .onEnded({value in
                        let translation = value.translation.width
                        let width = UIScreen.screenSize.width - 50
                        
                        let swipeStatus = (translation > 0 ? translation : -translation)
                        
                        withAnimation {
                            if swipeStatus > (width / 2) {
                                xOffset = (translation > 0 ? width : -width) * 2
                                endSwipe = true
                                endSwipeAction()
                            } else {
                                xOffset = .zero
                            }
                        }
                    })
            
            )
    }
    
    func getRotation(angle: Double) -> Double {
        return (xOffset / (UIScreen.screenSize.width - 50)) * angle
    }
    
    func endSwipeAction() {
        withAnimation(.none) {
            endSwipe = true
        }
        
        // preserve memory
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let _ = vm.displaying_pup?.first {
                let _ = withAnimation {
                    vm.displaying_pup?.removeFirst()
                }
            }
        }
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct StackedCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
