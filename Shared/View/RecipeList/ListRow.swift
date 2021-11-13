//
//  ListRow.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 22/10/21.
//

import SwiftUI

struct ListRow: View {
    @StateObject var imageLoader = ImageLoader()
    var fullListItem: QuickNEasy
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                ZStack {
                    Rectangle()
                        .stroke(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), lineWidth: 10)
                        .frame(width: 70, height: 70)
                        .cornerRadius(8)
                    
                    Group{
                        if imageLoader.image != nil {
                            Image(uiImage: imageLoader.image!)
                                .resizable().aspectRatio(contentMode: .fill)
                                .frame(width: 66, height: 66, alignment: .center)
                                .mask(Rectangle())
                                .cornerRadius(8)
                        } else if imageLoader.errorMessage != nil {
                            Image("swiftuihandbook")
                                .resizable().aspectRatio(contentMode: .fill)
                                .frame(width: 66, height: 66, alignment: .center)
                                .mask(Rectangle())
                                .cornerRadius(8)
                        } else {
                            ZStack {
                                Color.randomColor()
                                    .frame(width: 66, height: 66, alignment: .center)
                                    .mask(Rectangle())
                                    .cornerRadius(8)
                                ProgressView()
                                    .scaleEffect(1, anchor: .center)
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            }
                        }
                    }
                    .onAppear {
                        imageLoader.fetch(for: fullListItem.backgroundImg)
                    }
                }
                .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 20)
                .padding(.top, 2)
                
                VStack(alignment: .leading) {
                    Text(fullListItem.title)
                        .font(.title)
                        .bold()
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        
                    Text(fullListItem.time)
                        .font(.subheadline)
                    
                    Text(fullListItem.descriptions)
                        .font(.footnote)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 1)
                }
                .padding(.leading, 8)
                .padding(.top, 0)
                Spacer()
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black.opacity(0.3))
                .padding(.top, 8)
        }
        .padding(.horizontal, 8)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(fullListItem: QuickNEasy.quickNEasy[0])
    }
}
