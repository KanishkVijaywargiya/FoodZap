//
//  ChipButton.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 23/10/21.
//

import SwiftUI

struct SeeMoreButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black.opacity(0.3))
            
            Text("see more")
                .font(.headline)
                .frame(width: 200, height: 50)
                .background(
                    Color(hex: Colors.backgroundCol)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.black, lineWidth: 1.9)
                        .blendMode(.normal)
                        .opacity(0.7)
                )
                .cornerRadius(50)
        }
    }
}

struct ChipButton_Previews: PreviewProvider {
    static var previews: some View {
        SeeMoreButton()
    }
}
