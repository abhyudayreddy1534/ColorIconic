//
//  testView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 12/06/24.
//

import SwiftUI

struct SymmetricalShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Adjusting the size and position of the shape within the given rectangle
        let scale = min(rect.width, rect.height) / 100
        let xOffset = rect.midX
        let yOffset = rect.midY
        
        // Define the path points for one half of the shape
        path.move(to: CGPoint(x: 0 * scale + xOffset, y: 0 * scale + yOffset))
        
        path.addCurve(to: CGPoint(x: 50 * scale + xOffset, y: 50 * scale + yOffset),
                      control1: CGPoint(x: 25 * scale + xOffset, y: -10 * scale + yOffset),
                      control2: CGPoint(x: 75 * scale + xOffset, y: 25 * scale + yOffset))
        
        path.addCurve(to: CGPoint(x: 0 * scale + xOffset, y: 100 * scale + yOffset),
                      control1: CGPoint(x: 25 * scale + xOffset, y: 75 * scale + yOffset),
                      control2: CGPoint(x: -25 * scale + xOffset, y: 110 * scale + yOffset))
        
        return path
    }
}

struct SymmetricalShapeView: View {
    var body: some View {
        ZStack {
            // Background color
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            // Original half shape
            SymmetricalShape()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(0))
            
            // Mirrored half shape
            SymmetricalShape()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(180))
                .scaleEffect(x: -1, y: 1)
        }
    }
}

struct TestView: View {
    var body: some View {
        SymmetricalShapeView()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
