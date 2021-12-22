//
//  DeveloperCard.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 21/12/21.
//

import SwiftUI

struct DeveloperCard: View {
    var dev: Developer
    @Environment(\.colorScheme) var color
    
    var gradient1: [Color] = [
        Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), Color(#colorLiteral(red: 0.4156862745, green: 0.1882352941, blue: 0.5764705882, alpha: 1))
    ]
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            Image(dev.profileImg)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: dev.profileImg, in: animation)
                .frame(height: 265)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(dev.name)
                        .font(.custom("American Typewriter", size: 15).bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: 250, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    Text(dev.category)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                        .lineLimit(1)
                }
                
                Image(dev.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(15)
                    .padding(.trailing, 16)
                
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .matchedGeometryEffect(id: dev.id, in: animation)
            .background(BlurView(style: .light))
        }
        .frame(height: 335)
        .background(
            LinearGradient(gradient: Gradient(colors: gradient1), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(20)
    }
}

struct DeveloperCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        DeveloperCard(dev: developers[1], animation: namespace)
    }
}
