//
//  HorizontalScrollCards.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct HorizontalScrollCards: View {
    @StateObject var imageLoader = ImageLoaderService()
    @State private var image: UIImage = UIImage()

    var dummyData: QuickNEasy
    
    var width: CGFloat = 280
    var height: CGFloat = 360
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 4) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 210)
                    .onReceive(imageLoader.$image) { image in
                        self.image = image
                    }
                    .onAppear {
                        imageLoader.loadImage(for: dummyData.backgroundImg)
                    }
                
                //                VStack(spacing: 8) {
                //                    Image(dummyData.image1)
                //                        .resizable().frame(width: 35, height: 35)
                //                    Image(dummyData.image2)
                //                        .resizable().frame(width: 35, height: 35)
                //                        .clipShape(Circle())
                //                }
                //                .padding(.trailing, 16)
            }
            
            Text(dummyData.title)
                .font(.system(size: 24, weight:.bold))
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .frame(maxWidth: 200, alignment: .leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 8)
                .lineLimit(2)
            
            //            Text(dummyData.subTitle)
            //                .font(.subheadline)
            //                .foregroundColor(.white)
            //                .multilineTextAlignment(.leading)
            //                .frame(maxWidth: .infinity, alignment: .leading)
            //                .padding(.horizontal, 20)
            //                .padding(.bottom, 12)
            //                .lineLimit(1)
            
            Text(dummyData.description)
                .font(.subheadline)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .lineLimit(2)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
                .background(
                    Color.green
//                    LinearGradient(grad1: dummyData.gradient1, grad2: dummyData.gradient2, grad3: dummyData.gradient3)
                )
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

//struct HorizontalScrollCards_Previews: PreviewProvider {
//    static var dummyData = DummyData.dummyData[0]
//    static var previews: some View {
//        HorizontalScrollCards(dummyData: dummyData)
//    }
//}
