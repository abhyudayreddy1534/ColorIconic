//
//  RecordPlayerAnimationView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 07/06/24.
//

import SwiftUI

struct RecordPlayerAnimationView: View {
    @State private var degree: Double = 60
    @State private var shouldAnimate = false
    @State private var rotateArm: Bool = false
    var body: some View {
        Button(action: {
            shouldAnimate.toggle()
            if shouldAnimate {
                rotateArm.toggle()
                degree = 36000
            }
            else {
                rotateArm.toggle()
                degree = 0
            }
        }, label: {
            
            HStack {
                if shouldAnimate {
                    Text("Stop")
                    Image(systemName: "stop.circle")
                }
                else {
                    Text("Animate")
                    Image(systemName: "play.circle.fill")
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .frame(width: 150)
            .background(Capsule().stroke(lineWidth: 1.0))
        })
        ZStack {
            Base()
            Record(degree: $degree, shouldAnimate: $shouldAnimate)
                .offset(x: -30, y: 0)
            Hand()
                .offset(x:120, y: 55)
                .animation(.none, value: rotateArm)
                .animation(.easeIn) { view in
                    view.rotationEffect(Angle.degrees(rotateArm ? 15 : 0), anchor: UnitPoint(x: 1.5, y: 0.3))
                }
            
        }
    }
}

struct Base: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(colors: [.pink.opacity(0.8),
                                        .purple.opacity(0.8)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
//            .stroke(.purple, style: .init(lineWidth: 6))
            .frame(height: 300)
            .padding()
    }
}

struct Record: View {
    @Binding var degree: Double
    @Binding var shouldAnimate: Bool
    var body: some View {
        ZStack {
            Circle()
//                .fill(.black.opacity(0.8))
                .foregroundStyle(AngularGradient.init(gradient: Gradient(colors: [Color.black, Color.white]), center:.topLeading, startAngle: .degrees(0), endAngle: .degrees(90)))
                .frame(height: 250)
            
            ForEach(0..<5) { index in
                Circle()
                    .fill(index == 0 ? .white : .clear)
                    .stroke(.gray, style: .init(lineWidth: 1))
                    .frame(width: CGFloat(index + 1) * 40)
            }
        }
        .padding()
        .rotationEffect(Angle.degrees(degree))
        .animation(Animation.linear(duration: shouldAnimate ? 60 : 0).delay(1))
    }
}

struct Hand: View {
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .fill(.clear)
                    .stroke(.black, style: .init(lineWidth: 10))
                    .frame(height: 70)
                Circle()
                    .fill(.clear)
                    .stroke(.black, style: .init(lineWidth: 10))
                    .frame(height: 40)
                
                
            }
            .offset(x: 0, y: -150)
            .frame(width: 100, height: 100)
//            Path {path in
//                path.move(to: CGPoint(x: 50, y: 0))
//                path.addLine(to: CGPoint(x: 50, y: 200))
//                path.addLine(to: CGPoint(x: 0, y: 250))
//            }
//            .stroke(.white, lineWidth: 20)
//            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Path {path in
                path.move(to: CGPoint(x: 50, y: 0))
                path.addLine(to: CGPoint(x: 50, y: 200))
                path.addLine(to: CGPoint(x: 0, y: 250))
            }
            .stroke(.black, lineWidth: 10)
            .shadow(color: .white, radius: 3)
        }
        .frame(width: 100, height: 400)
    }
}

#Preview(body: {
    Hand()
})

#Preview {
    RecordPlayerAnimationView()
}
