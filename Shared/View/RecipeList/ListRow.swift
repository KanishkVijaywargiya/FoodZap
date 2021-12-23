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
                        .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), lineWidth: 10)
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
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 66, height: 66, alignment: .center)
                                .mask(Rectangle())
                                .background(Color.white)
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
                .shadow(color: .black.opacity(0.3), radius: 3)
                .padding(.top, 2)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .top) {
                        Text(fullListItem.title)
                            .font(.custom("American Typewriter", size: 18).bold())
                            .lineLimit(1)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Text(fullListItem.time)
                            .font(.subheadline)
                            .padding(4)
                            .background(BlurView(style: .light))
                            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), lineWidth: 1))
                            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }
                    
                    Text(fullListItem.descriptions)
                        .font(.custom("American Typewriter", size: 12))
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 1)
                }
                .padding(.leading, 8)
                .padding(.top, 0)
                Spacer()
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black.opacity(0.1))
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
