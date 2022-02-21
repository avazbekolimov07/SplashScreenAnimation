//
//  ContentView.swift
//  SplashScreenAnimation
//
//  Created by 1 on 24/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var startAnimation: Bool = false
    
    @State var circleAnimation1: Bool = false
    @State var circleAnimation2: Bool = false
    
    @State var endAnimation: Bool = false
    
    var body: some View {
        ZStack {
            
            Color("pink")
                
            Group {
                
                // Custom Shape With Animation...
                SplashShape()
                //trimming...
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                // stroke to get outline...
                    .stroke(Color.white,
                            style: StrokeStyle(lineWidth: 30,
                                               lineCap: .round,
                                               lineJoin: .round))
                
                // Two Circles...
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleAnimation1 ? 1 : 0)
                    .offset(x: -80, y: 22)
                
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleAnimation2 ? 1 : 0)
                    .offset(x: 80, y: -22)
                
            } // Group
            // Default Frame...
            .frame(width: 220, height: 130)
            .scaleEffect(endAnimation ? 0.15 : 0.9)
            .rotationEffect(.init(degrees: endAnimation ? 85 : 0))
        } //: ZSTACK
        .ignoresSafeArea()
        .onAppear {
            // delay Start.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.spring().delay(0.15)){
                    circleAnimation1.toggle()
                }
                
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 0.3)) {
                    startAnimation.toggle()
                }
                
                withAnimation(.spring().delay(0.7)) {
                    circleAnimation2.toggle()
                }
                
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(0.3)) {
                    endAnimation.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
