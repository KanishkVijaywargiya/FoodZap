//
//  BigCards.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct BigCards: View {
    @StateObject var imageLoader = ImageLoader()
    var dummyData: QuickNEasy
    var gradient1: [Color] = [
        Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), Color(#colorLiteral(red: 0.4156862745, green: 0.1882352941, blue: 0.5764705882, alpha: 1))
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Group{
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 265)
                } else if imageLoader.errorMessage != nil {
//                    Text(imageLoader.errorMessage!)
                    Image("swiftuihandbook")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 265)
                } else {
                    ZStack {
                        Color.randomColor()
                        ProgressView()
                            .scaleEffect(2, anchor: .center)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    }
                    .frame(height: 265)
                }
            }
            .onAppear {
                imageLoader.fetch(for: dummyData.backgroundImg)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(dummyData.title)
                        .font(.system(size: 24, weight:.bold))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: 250, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    Text(dummyData.time)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                        .lineLimit(1)
                }
                
                Image(systemName: "chevron.right.circle")
                    .frame(width: 25, height: 25)
                    .font(.system(size: 25, weight: .thin))
                    .foregroundColor(.white)
                    .padding(12)
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(BlurView(style: .light))
            
            Spacer()
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

//struct BigCards_Previews: PreviewProvider {
//    static var dummyData = DummyData.dummyData[0]
//    static var previews: some View {
//        BigCards(dummyData: dummyData)
//    }
//}
