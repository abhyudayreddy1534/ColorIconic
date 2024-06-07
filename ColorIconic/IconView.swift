//
//  IconView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 06/06/24.
//

import SwiftUI

struct IconView: View {
    let logoColors: [Color] = [.green, .yellow, .orange, .red, .purple, .blue]
    var body: some View {
        VStack {
//            stylised VisionPro icon
            Image(systemName: "visionpro")
                .resizable()
                .scaledToFit()
                .font(.system(size: 200, weight: .ultraLight))
                .foregroundStyle(
                    LinearGradient(colors: [.gray, .black, .gray], startPoint: .top, endPoint: .bottom),
                    EllipticalGradient(colors:[.purple, .black], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.5)
                )
                .shadow(color: .black.opacity(0.9), radius: 25, y: 5)
            
//            Apple Logo
                VStack(spacing: 0) {
                    ForEach(0 ..< logoColors.count) { index in
                        Rectangle()
                            .frame(height: index == 0 ? 110 : index == 6 ? 70 : 45)
                            .foregroundStyle(logoColors[index])
                    }
                }
                .mask(Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(
                        .white
                    )
                .padding(.vertical, 10))
        }
        .padding()

    }
}

#Preview {
    IconView()
}
