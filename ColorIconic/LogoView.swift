//
//  LogoView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 12/06/24.
//

import SwiftUI

struct ReactLogoView: View {
    let width: CGFloat
    var body: some View {
        Ellipse()
            .stroke(.cyan, lineWidth: 15)
            .frame(width: width, height: width * 2.5)
            .padding()
        
    }
}

struct AndroidLogoView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width / 2
        let height = rect.height
        
//        Head
//        arc for head
        path.addArc(center: CGPoint(x: rect.midX, y: height * 0.26),
                    radius: (width) - (width * 0.12),
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)
        path.move(to: CGPoint(x: width * 0.12, y: height * 0.26))
        path.addLine(to: CGPoint(x: rect.midX, y: height * 0.26))
        
//        antenna
        path.move(to: CGPoint(x: width * 0.1, y: rect.minY))
        path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.08))
        
//        eyes
        path.addRoundedRect(in: CGRect(x: width * 0.5,
                                       y: height * 0.1,
                                       width: 16,
                                       height: 16),
                            cornerSize: CGSize(width: 8, height: 8))
        
//        Body
        path.move(to: CGPoint(x: rect.midX, y: height * 0.3))
        path.addLine(to: CGPoint(x: width * 0.12, y: height * 0.3))
        path.addLine(to: CGPoint(x: width * 0.12, y: height * 0.75))
        path.addQuadCurve(to: CGPoint(x: width * 0.2, y: height * 0.78),
                          control: CGPoint(x: width * 0.12, y: height * 0.77))
        path.addLine(to: CGPoint(x: width , y: height * 0.78))
        
//        Hand
        path.addRoundedRect(in: CGRect(x: rect.minX - 18,
                                       y: height * 0.3,
                                       width: width * 0.2,
                                       height: height * 0.4),
                            cornerSize: CGSize(width: (width * 0.2) / 2, height: 20))
        
//        Legs
        path.move(to: CGPoint(x: width * 0.8, y: height * 0.82))
        path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.82))
        path.addLine(to: CGPoint(x: width * 0.5, y: (height * 1) + 10))
        path.addQuadCurve(to: CGPoint(x: width * 0.8, y: (height * 1) + 10),
                          control: CGPoint(x: width * 0.66, y: (height * 1.12)))
        path.addLine(to: CGPoint(x: width * 0.8, y: (height * 1) + 10))
        
        path.closeSubpath()
        return path
    }
    
}

struct AppleLogoView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
//        try for vertical leaf and rotate it 45 degrees
//        var leafPath = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.height * 3/12))
//        leafPath.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.height * 3/12), control: CGPoint(x: rect.width * 0.3, y: rect.height))
        path.addQuadCurve(to: CGPoint(x: Int(rect.width) * 7/10, y: Int(rect.height * 0.4)/12),
                          control: CGPointMake(rect.width * 5.3/10,
                                               rect.height * 0.1))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.height * 3/12),
                          control: CGPointMake(rect.width * 6.1/10,
                                               rect.height * 3.3/12))
        
//        path.closeSubpath()
//        path.addPath(leafPath)
        return path
    }
}

struct LogoView: View {
    private var androidLogoColor = Color(red: 160/255.0, green: 192/255.0, blue: 54/255.0)
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 50)
                    ReactLogoView(width: 100)
                        .rotationEffect(.degrees(90))
                    ReactLogoView(width: 100)
                        .rotationEffect(.degrees(30))
                    ReactLogoView(width: 100)
                        .rotationEffect(.degrees(-30))
                }
            }
            
            ZStack {
                AndroidLogoView()
                    .stroke(androidLogoColor, lineWidth: 2)
                    .frame(width: (300 * 7 / 10), height: 300)
                    .foregroundStyle(androidLogoColor)
                    .padding()
                AndroidLogoView()
                    .stroke(androidLogoColor, lineWidth: 2)
                    .frame(width: (300 * 7 / 10), height: 300)
                    .foregroundStyle(androidLogoColor)
                    .rotationEffect(.degrees(180))
                    .scaleEffect(x: 1, y: -1)
                    .padding()
            }
            
            ZStack {
                AppleLogoView()
                    .stroke(.black, lineWidth: 2)
                .frame(width: 300, height: 300)
            }
            
            
            
            
        }
    }
}

#Preview {
    LogoView()
}
