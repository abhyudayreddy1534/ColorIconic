//
//  AnimationView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 06/06/24.
//

import SwiftUI

struct AnimationView: View {
    var body: some View {
        ZStack {
            Path {path in
                path.move(to: CGPoint(x: 50, y: 0))
                path.addLine(to: CGPoint(x: 150, y: 0))
                path.addLine(to: CGPoint(x: 200, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 0, y: 50))
                path.addLine(to: CGPoint(x: 50, y: 0))
            }
                .fill(
                    EllipticalGradient(colors: [.white, .purple.opacity(0.5)], center: UnitPoint(x: 0.5, y: 0.25), startRadiusFraction: 0, endRadiusFraction: 0.6)
                )
                .stroke(.purple, style: .init(lineWidth: 4))
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
                .padding()
            
            Path {path in
                path.move(to: CGPoint(x: 50, y: 0))
                path.addLine(to: CGPoint(x: 25, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 75, y: 50))
                path.addLine(to: CGPoint(x: 50, y: 00))
                path.move(to: CGPoint(x: 0, y: 50))
                path.addLine(to: CGPoint(x: 200, y: 50))
                
                path.move(to: CGPoint(x: 150, y: 0))
                path.addLine(to: CGPoint(x: 175, y: 50))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 125, y: 50))
                path.addLine(to: CGPoint(x: 150, y: 0))
                
                path.move(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 75, y: 50))
                
                path.move(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 125, y: 50))
            }
            .stroke(.purple.opacity(0.5), style: .init(lineWidth: 1.5))
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
                .padding()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
