//
//  ContentView.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
//                .fill()
                .foregroundStyle(LinearGradient(colors: [.purple, .orange],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing),
                                 LinearGradient(colors: [.yellow, .pink],
                                                startPoint: .bottomLeading,
                                                endPoint: .topTrailing))
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(.white, lineWidth: 5)
                .frame(width: 60, height: 60)
            
            Circle()
                .stroke(.white, lineWidth: 5)
                .frame(width: 25)
            
            Circle()
                .stroke(.white, lineWidth: 5)
                .frame(width: 5)
                .offset(x: 18, y: -18)
            
        }
        .compositingGroup()
        .padding()
    }
}

#Preview {
    ContentView()
}
