//
//  BigCards.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct BigCards: View {
    var dummyData: DummyData
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(dummyData.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: 250, alignment: .leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.leading)
                
                VStack(spacing: 8) {
                    Image(dummyData.image1)
                        .resizable().frame(width: 35, height: 35)
                    Image(uiImage: #imageLiteral(resourceName: "mengto"))
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                }
                .padding(.trailing, 16)
            }
            
            Text(dummyData.subTitle)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            Spacer()
            
            Image(dummyData.backgroundImg)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 20)
                .padding(.horizontal, 20)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(dummyData.description)
                        .multilineTextAlignment(.leading)
                }
                .lineLimit(2)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.horizontal)
                
                Image(systemName: "chevron.right.circle")
                    .frame(width: 36, height: 36)
                    .font(.system(size: 35, weight: .thin))
                    .foregroundColor(.white)
                    .padding(12)
            }
            .padding(12)
            .background(BlurView(style: .light))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        .frame(height: 335)
        .background( LinearGradient(grad1: dummyData.gradient1, grad2: dummyData.gradient2, grad3: dummyData.gradient3) )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(20)
    }
}

struct BigCards_Previews: PreviewProvider {
    static var dummyData = DummyData.dummyData[0]
    static var previews: some View {
        BigCards(dummyData: dummyData)
    }
}
