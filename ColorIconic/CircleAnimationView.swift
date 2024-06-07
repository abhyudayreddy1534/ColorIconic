//
//  CircleAnimationView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 06/06/24.
//

import SwiftUI

struct CircleAnimationView: View {
    @State private var scaledInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea(.all)
            ZStack {
                CircleView(moveInOut: $moveInOut)
                
                CircleView(moveInOut: $moveInOut)
                    .rotationEffect(.degrees(60))
                
                CircleView(moveInOut: $moveInOut)
                    .rotationEffect(.degrees(120))
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaledInOut ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
            .onAppear(perform: {
                moveInOut.toggle()
                scaledInOut.toggle()
                rotateInOut.toggle()
            })
        }
    }
}

struct CircleView: View {
    @Binding var moveInOut: Bool
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 100, height: 100)
                .offset(x: 0, y: moveInOut ? -50 : 0)
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                .frame(width: 100, height: 100)
                .offset(x: 0, y: moveInOut ? 50 : 0)
        }
        .opacity(0.5)
    }
}

#Preview {
    CircleAnimationView()
}
