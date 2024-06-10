//
//  Lanyardview.swift
//  ColorIconic
//
//  Created by Sravanthi Chinthireddy on 10/06/24.
//

import SwiftUI

struct Lanyardview: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(colors: [.pink.opacity(1), .indigo.opacity(1), .purple.opacity(1)], startPoint: .bottomLeading, endPoint: .topTrailing))
            
            VStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 100, height: 20)
                    .padding(.top, 20)
                Spacer()
                
                Image(systemName: "apple.logo")
                    .font(.system(size: 250))
                Text("Abhyuday Reddy Nandikonda")
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                Text("WWDC 24")
                    .font(.system(size: 50, weight: .black))
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding(.bottom, 30)
            }
            .blendMode(.destinationOut)
        }
        .compositingGroup()
        .shadow(color: .gray, radius: 15, x: -10, y: 5)
        .padding()
        .padding(.vertical, 50)
    }
}

#Preview {
    Lanyardview()
}
