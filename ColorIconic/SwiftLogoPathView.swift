//
//  SwiftLogoPathView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 12/06/24.
//

import SwiftUI

struct SwiftLogoShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
//       starting from right wing edge tip.
        let startPoint = CGPoint(x: rect.minX, y: height * 0.63)
        
        path.move(to: startPoint)
        path.addCurve(to: CGPoint(x: width * 0.98, y: height * 0.93),
                      control1: CGPoint(x: width * 0.5, y: height * 1.2), control2: CGPoint(x: width * 0.85, y: height * 0.7))
        path.addQuadCurve(to: CGPoint(x: width * 0.9, y: height * 0.68),
                          control: CGPoint(x: width, y: height * 0.8))
        
        path.addQuadCurve(to: CGPoint(x: width * 0.61, y: rect.minY), control: CGPoint(x: width, y: height * 0.3))
        path.addQuadCurve(to: CGPoint(x: width * 0.7, y: height * 0.53),
                          control: CGPoint(x: width * 0.78, y: height * 0.3))
        path.addQuadCurve(to: CGPoint(x: width * 0.215, y: height * 0.09),
                          control: CGPoint(x: width * 0.35, y: height * 0.25))
        path.addQuadCurve(to: CGPoint(x: width * 0.5, y: height * 0.48),
                          control: CGPoint(x: width * 0.3, y: height * 0.25))
        path.addQuadCurve(to: CGPoint(x: width * 0.1, y: height * 0.15),
                          control: CGPoint(x: width * 0.35, y: height * 0.4))
        path.addQuadCurve(to: CGPoint(x: width * 0.56, y: height * 0.71),
                          control: CGPoint(x: width * 0.33, y: height * 0.51))
        path.addQuadCurve(to: startPoint,
                          control: CGPoint(x: width * 0.35, y: height * 0.8))
        
        return path
    }
}

struct SwiftLogoPathView: View {
    private var swiftTopColor = Color(red: 251/255.0, green: 171/255.0, blue: 63/255.0)
    private var swiftBottomColor = Color(red: 1.0, green: 59/255.0, blue: 40/255.0)
    private var swiftUITopColor = Color(red: 1/255.0, green: 232/255.0, blue: 243/255.0)
    private var swiftUIBottomColor = Color(red: 1.0/255.0, green: 20/255.0, blue: 148/255.0)
    
    private var topMostLayerFillColor = Color.black
    private var bottomLayerFillColor = Color(red: 18.0/255.0, green: 65/255.0, blue: 212/255.0).opacity(1)
    private var bottomMostLayerFillColor = Color(red: 7/255.0, green: 154/255.0, blue: 255/255.0).opacity(1)
    private var LastLayerFillColor = Color(red: 5/255.0, green: 215/255.0, blue: 250/255.0).opacity(1)

    var body: some View {
        VStack {
            
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [swiftUITopColor, swiftUIBottomColor]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
//                Last layer
                SwiftLogoShape()
                    .offset(x:-105, y: -105)
                    .fill(LinearGradient(colors: [swiftUITopColor, LastLayerFillColor],
                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 300)
//                    .clipped()
                    .padding()
//                top -2
                SwiftLogoShape()
                    .offset(x:-70, y: -70)
                    .fill(LinearGradient(colors: [swiftUITopColor, bottomMostLayerFillColor],
                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 300)
//                    .clipped()
                    .padding()
//                top -1
                SwiftLogoShape()
                    .offset(x:-35, y: -35)
                    .fill(LinearGradient(colors: [swiftUITopColor, bottomLayerFillColor],
                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 300)
//                    .clipped()
                    .padding()
                // Swift logo shape Top
                SwiftLogoShape()
                    .stroke(topMostLayerFillColor, lineWidth: 1)
                    .fill(Color.black)
                    .frame(width: 300, height: 300)
                    .shadow(radius: 10)
                    .padding()
            }
            
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [swiftTopColor, swiftBottomColor]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                // Swift logo shape
                SwiftLogoShape()
                    .stroke(.white, lineWidth: 1)
                    .fill(Color.white)
                    .frame(width: 300, height: 300)
                    .shadow(radius: 10)
                    .padding()
            }
        }
    }
}

#Preview {
    SwiftLogoPathView()
}
