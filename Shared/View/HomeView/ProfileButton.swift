//
//  ProfileButton.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct ProfileButton: View {
    var body: some View {
        // MARK: Profile button
        
        ZStack {
            Circle()
                .frame(width: 45, height: 45)
                .foregroundColor(.black.opacity(0.1))
                .background(
                    LinearGradient(grad1: Color(#colorLiteral(red: 1, green: 0, blue: 0.5176470588, alpha: 1)), grad2: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), grad3: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                )
                .clipShape(Circle())
                .offset(x: 10, y: -20)
            
            Image(systemName: "person.crop.circle")
                .renderingMode(.template)
                .font(.system(size: 20))
                .padding(12)
                .padding(.horizontal, 20)
                .background(
                    BlurView(style: .light)
                )
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), lineWidth: 0.2)
                )
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton()
    }
}
