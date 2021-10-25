//
//  DetailView.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 24/10/21.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(red: 242, green: 239, blue: 228).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    Image("pavbhaji")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 6)
                        .overlay(
                            FavButton()
                                .offset(x: 170, y: 150)
                        )

                    Spacer()
                    
                    // food title, clock icon, total time
                    VStack(alignment: .leading) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Pav Bhaji")
                                .font(.largeTitle)
                                .bold()
                            
                            Spacer()
                            
                            HStack(alignment: .center, spacing: 0) {
                                Image(systemName: "clock")
                                    .font(.system(size: 22, weight: .bold))
                                    .padding(.trailing)
                                
                                Text("70 mins")
                                    .font(.system(size: 18, weight: .semibold))
                                    .overlay(
                                        Image("streetfoods")
                                            .padding(.top, 90)
                                            .padding(.trailing, 52)
                                    )
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 16)
                        
                        // category name
                        Text("Vegetarian")
                            .font(.callout)
                            .padding(.horizontal, 16)
                        
                        // protein, carbohydrates, calories, fats stats
                        VStack(alignment: .leading) {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black.opacity(0.3))
                                .padding(.horizontal, 16)
                                .padding(.top, 30)
                            
                            // protein, carbs, cals, fats
                            HStack {
                                VStack {
                                    Text("Proteins")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("19g")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.green)
                                }
                                Spacer()
                                VStack {
                                    Text("Carbs")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("90g")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.green)
                                }
                                Spacer()
                                VStack {
                                    Text("Cals")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("646kcal")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.green)
                                }
                                Spacer()
                                VStack {
                                    Text("Fats")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("24g")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.green)
                                }
                            }
                            .padding([.horizontal, .vertical], 14)
                            .padding(.horizontal, 16)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black.opacity(0.3))
                                .padding(.horizontal, 16)
                            
                            // course, health, difficulty stats
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    VStack {
                                        Text("Course")
                                            .font(.system(size: 16, weight: .bold))
                                        Text("Main Course")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.green)
                                    }
                                    .frame(width: 150, height: 50)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.black, lineWidth: 1.9)
                                            .blendMode(.normal)
                                            .opacity(0.7)
                                    )
                                    .cornerRadius(50)
                                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("Health")
                                            .font(.system(size: 16, weight: .bold))
                                        Text("Glutten Free")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.green)
                                    }
                                    .frame(width: 150, height: 50)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.black, lineWidth: 1.9)
                                            .blendMode(.normal)
                                            .opacity(0.7)
                                    )
                                    .cornerRadius(50)
                                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Text("Difficulty")
                                            .font(.system(size: 16, weight: .bold))
                                        Text("Moderate")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.green)
                                    }
                                    .frame(width: 150, height: 50)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.black, lineWidth: 1.9)
                                            .blendMode(.normal)
                                            .opacity(0.7)
                                    )
                                    .cornerRadius(50)
                                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                }
                                .padding([.horizontal, .vertical], 14)
                            }
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black.opacity(0.3))
                                .padding(.horizontal, 16)
                            
                            // overview, ingridients, procedures
                            Group {
                                // overview
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Overview").font(.largeTitle.bold())
                                    
                                    Text("This Dal Makhani recipe is a restaurant style version with subtle smoky flavors and creaminess of the lentils. Dal Makhani is one of the most popular lentil recipes from the North Indian cuisine made with whole urad dal (black gram) and kidney beans.")
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.black.opacity(0.3))
                                        .padding(.top)
                                }
                                .padding(.horizontal, 16)
                                
                                // ingridients
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Ingridients")
                                        .font(.largeTitle.bold())
                                    
                                    ForEach(0..<5) { _ in
                                        HStack {
                                            Circle()
                                                .frame(width: 15, height: 15)
                                                .padding(.bottom)
                                            
                                            Text("1 cup dried white chickpeas [canned chickpeas can also be used]").font(.system(size: 18, weight: .medium))
                                        }
                                        .padding(.horizontal, 16)
                                    }
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.black.opacity(0.3))
                                        .padding(.top)
                                }
                                .padding(.horizontal, 16)
                                
                                // procedures
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Procedures")
                                        .font(.largeTitle.bold())
                                    
                                    ForEach(0..<5) { _ in
                                        HStack {
                                            Circle()
                                                .frame(width: 15, height: 15)
                                                .padding(.bottom)
                                            
                                            Text("1 cup dried white chickpeas [canned chickpeas can also be used]").font(.system(size: 18, weight: .medium))
                                        }
                                        .padding(.horizontal, 16)
                                    }
                                    
                                    // ring circle design
                                    ZStack {
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(.black.opacity(0.3))
                                        
                                        Image(systemName: "circle.fill")
                                            .frame(width: 30, height: 30)
                                            .background(Color.white)
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.black.opacity(0.3), lineWidth: 10)
                                                    .blendMode(.normal)
                                                    .opacity(0.7)
                                            )
                                            .cornerRadius(50)
                                    }
                                    .padding(.top)
                                }
                                .padding(.horizontal, 16)
                                .padding(.bottom)
                            }
                        }
                    }
                }
            }
            
            // back & share button
            HStack(alignment: .top) {
                BackButton()
                    .padding(.leading, 16)
                    .padding(.top)
                
                Spacer()
                
                ShareButton()
                    .padding(.trailing, 16)
                    .padding(.top)
            }
        }
        .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct ShareButton: View {
    var body: some View {
        Image(systemName: "square.and.arrow.up")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(BlurView(style: .systemMaterialDark))
            .mask(Circle())
    }
}

struct BackButton: View {
    var body: some View {
        Image(systemName: "chevron.backward")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(BlurView(style: .systemMaterialDark))
            .mask(Circle())
    }
}

struct FavButton: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.red)
            .clipShape(Circle())
    }
}
