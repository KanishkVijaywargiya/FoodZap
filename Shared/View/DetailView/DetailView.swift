//
//  DetailView.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 24/10/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var imageLoader = ImageLoaderService()
    @State private var image: UIImage = UIImage()
    
    var dishesData: QuickNEasy
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 6)
                        .overlay(
                            FavButton()
                                .position(x: UIScreen.main.bounds.width - 35, y: 300)
                        )
                        .onReceive(imageLoader.$image) { image in
                            self.image = image
                        }
                        .onAppear {
                            imageLoader.loadImage(for: dishesData.backgroundImg)
                        }
                    
                    Spacer()
                    
                    // food title, clock icon, total time
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 0) {
                            Text(dishesData.title)
                                .font(.largeTitle)
                                .bold()
                                .lineLimit(2)
                            
                            Spacer()
                            
                            HStack(alignment: .center, spacing: 0) {
                                Image(systemName: "clock")
                                    .font(.system(size: 22, weight: .bold))
                                    .padding(.trailing, 4)
                                
                                Text(dishesData.time).font(.system(size: 18, weight: .semibold))
                            }
                            .padding(.top, 8)
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 16)
                        
                        // category name
                        Text(dishesData.category)
                            .font(.callout)
                            .padding(.horizontal, 16)
                        
                        
                        CuisineLabel(colorBg: "#0A79DF")
                            .position(x: UIScreen.main.bounds.width + 48, y: 19)
                            .offset(x: -14, y: -10)
                            .overlay(
                                Text(dishesData.cusine)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 18, weight: .bold))
                                    .offset(x: 125, y: -18)
                                
                            )
                        
                        // protein, carbohydrates, calories, fats stats
                        VStack(alignment: .leading) {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.black.opacity(0.3))
                                .padding(.horizontal, 16)
                                .padding(.top, 30)
                            
                            // protein, carbs, cals, fats
                            if (!dishesData.protein.isEmpty && !dishesData.carbohydrates.isEmpty && !dishesData.calories.isEmpty && !dishesData.fat.isEmpty) {
                                HStack {
                                    if (!dishesData.protein.isEmpty) {
                                        VStack {
                                            Text("Proteins")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.protein)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    if (!dishesData.carbohydrates.isEmpty) {
                                        VStack {
                                            Text("Carbs")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.carbohydrates)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    if (!dishesData.calories.isEmpty) {
                                        VStack {
                                            Text("Cals")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.calories)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    if (!dishesData.fat.isEmpty) {
                                        VStack {
                                            Text("Fats")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.fat)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                    }
                                }
                                .padding([.horizontal, .vertical], 14)
                                .padding(.horizontal, 16)
                                
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.black.opacity(0.3))
                                    .padding(.horizontal, 16)
                            }
                            
                            // course, health, difficulty stats
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    if (!dishesData.course.isEmpty) {
                                        VStack {
                                            Text("Course")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.course)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                        .frame(width: 150, height: 50)
                                        .background(Color(hex: Colors.backgroundCol))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color.black, lineWidth: 1.9)
                                                .blendMode(.normal)
                                                .opacity(0.3)
                                        )
                                        .cornerRadius(50)
                                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                    }
                                    
                                    Spacer()
                                    
                                    if (!dishesData.healthPreference.isEmpty) {
                                        VStack {
                                            Text("Health")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.healthPreference)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                        .frame(width: 150, height: 50)
                                        .background(Color(hex: Colors.backgroundCol))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color.black, lineWidth: 1.9)
                                                .blendMode(.normal)
                                                .opacity(0.3)
                                        )
                                        .cornerRadius(50)
                                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                    }
                                    
                                    Spacer()
                                    
                                    if (!dishesData.difficultyLevel.isEmpty) {
                                        VStack {
                                            Text("Difficulty")
                                                .font(.system(size: 16, weight: .bold))
                                            Text(dishesData.difficultyLevel)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.green)
                                        }
                                        .frame(width: 150, height: 50)
                                        .background(Color(hex: Colors.backgroundCol))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color.black, lineWidth: 1.9)
                                                .blendMode(.normal)
                                                .opacity(0.3)
                                        )
                                        .cornerRadius(50)
                                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 1)
                                    }
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
                                    
                                    Text(dishesData.description)
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
                                    
                                    ForEach(dishesData.ingridients, id: \.self) { item in
                                        HStack(alignment: .top) {
                                            Circle()
                                                .frame(width: 15, height: 15)
                                                .padding(.top, 4)
                                            
                                            Text(item).font(.system(size: 18, weight: .medium))
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
                                    
                                    ForEach(dishesData.procedure, id: \.self) { item in
                                        HStack(alignment: .top) {
                                            Circle()
                                                .frame(width: 15, height: 15)
                                                .padding(.top, 4)
                                            
                                            Text(item).font(.system(size: 18, weight: .medium))
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
                        .padding(.top, -16)
                    }
                }
            }
            
            // back & share button
            HStack(alignment: .top) {
                GlassButton(iconName: "chevron.backward")
                    .padding(.leading, 8)
                    .padding(.top, 45)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                
                Spacer()
                
                GlassButton(iconName: "square.and.arrow.up")
                    .padding(.trailing, 8)
                    .padding(.top, 45)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    let quick = QuickNEasy(backgroundImg: "", calories: "", carbohydrates: "", category: "", course: "", cusine: "", description: "", difficultyLevel: "", fat: "", healthPreference: "", procedureVideo: "", protein: "", time: "", title: "", ingridients: [], procedure: [])
//
//    static var previews: some View {
//        DetailView(dishesData: quick)
//    }
//}

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
