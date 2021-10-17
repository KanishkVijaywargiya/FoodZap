//
//  Cards.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct Cards: View {
    var width: CGFloat = 140
    var height: CGFloat = 260
    var dummyData: DummyData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Spacer()
            
            HStack {
                Spacer()
                Image(dummyData.backgroundImg)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        VStack(spacing: 8) {
                            Image(dummyData.image1)
                                .resizable().frame(width: 25, height: 25)
                            Image(dummyData.image2)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                        }
                            .position(x: 120, y: 30)
                    )
                Spacer()
            }
            Text(dummyData.title)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            Text(dummyData.subTitle)
                .font(.footnote)
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text(dummyData.description)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.top, 4)
                .padding(.bottom, 20)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
        }
        .padding(.all)
        .background(
            LinearGradient(grad1: dummyData.gradient1, grad2: dummyData.gradient2, grad3: dummyData.gradient3)
        )
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct Cards_Previews: PreviewProvider {
    static var dummyData = DummyData.dummyData[0]
    static var previews: some View {
        Cards(dummyData: dummyData)
    }
}
