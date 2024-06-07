//
//  ColorShifterView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 07/06/24.
//

import SwiftUI

struct ColorShifterView: View {
    @State private var shouldShiftColors: Bool = false
    @State private var image: String = "hue-magic-1"

    let backgroundColor: Color = .black
    let images = [
        "hue-magic-1",
        "hue-magic-2",
        "hue-magic-3",
        "hue-magic-4",
        "hue-magic-5",
        "hue-magic-6",
        "hue-magic-7",
        "hue-magic-8",
        "hue-magic-9",
        "hue-magic-10",
        "hue-magic-11",
        "hue-magic-12",
    ]
    
    var body: some View {
        VStack {
            ZStack {
                backgroundColor
                    .scaleEffect(1.5)
                Text(image)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                Image(image)
                    .scaledToFit()
                    .hueRotation(.degrees(shouldShiftColors ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(), value: shouldShiftColors)
                    //.animation(Animation.easeIn(duration: 1).repeatForever(autoreverses: false))

            }
            .onAppear(perform: {
                shouldShiftColors.toggle()
            })
            Picker("", selection: $image) {
                ForEach(images, id: \.self) { index in
                    Text(index)
                }
                .pickerStyle(WheelPickerStyle())
            }
        }
    }
}

#Preview {
    ColorShifterView()
}
