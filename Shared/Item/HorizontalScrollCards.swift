//
//  HorizontalScrollCards.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct HorizontalScrollCards: View {
    @StateObject var imageLoader = ImageLoader()
     
//    @State private var image: UIImage?
    var gradient1: [Color] = [
        Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), Color(#colorLiteral(red: 0.007843137255, green: 0.1058823529, blue: 0.4745098039, alpha: 1)), Color(#colorLiteral(red: 0.4156862745, green: 0.1882352941, blue: 0.5764705882, alpha: 1))
    ]
    
    var dummyData: QuickNEasy
    
    var width: CGFloat = 280
    var height: CGFloat = 360
    let transaction = Transaction(animation: Animation.easeIn(duration: 5.0))
    
    var body: some View {
        VStack(spacing: 0) {
            
            Group{
                if imageLoader.image != nil {
                    Image(uiImage: imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else if imageLoader.errorMessage != nil {
//                    Text(imageLoader.errorMessage!)
                    Image("swiftuihandbook")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    ZStack {
//                        Color.randomColor()
                        Image("swiftuihandbook")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .redacted(reason: .placeholder)
                        ProgressView()
                            .scaleEffect(2, anchor: .center)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    }
                    .frame(height: 200)
                }
            }
            .onAppear {
                imageLoader.fetch(for: dummyData.backgroundImg)
            }
            
            //            if(image != UIImage()) {
            //                Image(uiImage: image ?? UIImage())
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fill)
            //                    .onReceive(imageLoader.$image) { image in
            //                        self.image = image
            //                    }
            //
            //            } else {
            //                VStack{
            //                    Spacer()
            //                    Text("Loading")
            //                    Spacer()
            //                }
            //            }
            
            VStack {
                Text(dummyData.title)
                    .font(.system(size: 24, weight:.bold))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .frame(maxWidth: 200, alignment: .leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
                    .padding(.top, 16)
                    .lineLimit(1)
                
                Text(dummyData.time)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 12)
                    .lineLimit(1)
                
                Text(dummyData.descriptions)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 20)
                    .lineLimit(2)
            }
            .padding(.horizontal, 8)
        }
        .frame(width: width, height: height)
        .background(
            LinearGradient(gradient: Gradient(colors: gradient1), startPoint: .topLeading, endPoint: .bottomTrailing)
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
