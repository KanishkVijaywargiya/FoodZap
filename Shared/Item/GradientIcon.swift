//
//  GradientIcon.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 20/12/21.
//

import SwiftUI

struct GradientIcon: View {
    var icon: String = "questionmark"
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6808801889, green: 0.7434362769, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.6542388201, blue: 0.9848204255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(Image(systemName: icon).font(.system(size: 17)))
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.137254902, green: 0.1058823529, blue: 0.3098039216, alpha: 0.6))]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 36, height: 36)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(1))
                        .blendMode(.overlay)
            )
    }
}
struct GradientIcon_Previews: PreviewProvider {
    static var previews: some View {
        GradientIcon()
    }
}
