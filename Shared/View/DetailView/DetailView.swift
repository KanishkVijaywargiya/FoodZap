//
//  DetailView.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 24/10/21.
//

import SwiftUI
import Introspect

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var imageLoader = ImageLoader()
    @StateObject var hapticVM = HapticViewModel()
    @State private var isSharingSheetShowing: Bool = false
    var dishesData: QuickNEasy
    @State var uiTabarController: UITabBarController?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            ScrollView {
                GeometryReader { geo in
                    Group{
                        if imageLoader.image != nil {
                            Image(uiImage: imageLoader.image!)
                                .resizable()
                            //                                .aspectRatio(contentMode: .fill)
                                .scaledToFill()
                                .frame(width: geo.size.width, height: self.getHeightForHeaderImage(geo))
                                .clipped()
                                .offset(x: 0, y: self.getOffsetForHeaderImage(geo))
                        } else if imageLoader.errorMessage != nil {
                            Rectangle()
                                .foregroundColor(.gray.opacity(0.2))
                            //                            .frame(width: UIScreen.main.bounds.width, height: 300)
                                .frame(width: geo.size.width, height: self.getHeightForHeaderImage(geo))
                                .clipped()
                                .offset(x: 0, y: self.getOffsetForHeaderImage(geo))
                        } else {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.2))
                                //                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                    .frame(width: geo.size.width, height: self.getHeightForHeaderImage(geo))
                                    .clipped()
                                    .offset(x: 0, y: self.getOffsetForHeaderImage(geo))
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                            }
                        }
                    }
                    //                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                    .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 6)
                    .overlay(
                        FavButton(icon: "heart.fill")
                            .position(x: UIScreen.main.bounds.width - 35, y: 300)
                        //                        .onTapGesture {
                        //                            dishesData.isFav ? fullListVM.addToFav(favoriteType, of: dishesData.id) : fullListVM.removeFav(favoriteType, of: dishesData.id)
                        //                        }
                    )
                }.frame(height: 300)
                
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
                    
                    CategoryLogo(shade: dishesData.category == "Vegetarian" ? Colors.vegCol : Colors.nonVegCol)
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
                                Text(dishesData.descriptions)
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
                                            .frame(width: 8, height: 8)
                                            .padding(.top, 6)
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
                                            .frame(width: 8, height: 8)
                                            .padding(.top, 6)
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
                .foregroundColor(.black)
            }
            .onAppear {
                imageLoader.fetch(for: dishesData.backgroundImg)
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
                    .onTapGesture {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                        shareBtn()
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .introspectTabBarController { (UITabBarController) in
            UITabBarController.tabBar.isHidden = true
            uiTabarController = UITabBarController
        }.onDisappear{
            uiTabarController?.tabBar.isHidden = false
        }
    }
    
    func shareBtn() {
        isSharingSheetShowing.toggle()
        
        //        let image = body.snapshot()
        //        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        let dishesTitle = "Name - \(dishesData.title)"
        let dishesCategory = "Category - \(dishesData.category)"
        let dishesCusine = "Cusine - \(dishesData.cusine)"
        let dishesProtein = "Protein - \(dishesData.protein)"
        let dishesCarbohydrates = "Carbohydrates - \(dishesData.carbohydrates)"
        let dishesCalories = "Calories - \(dishesData.calories)"
        let openFullRecipe = "To know more, please download our app. See the full recipe ⤵️"
        let url = URL(string: "https://apple.com")
        let av = UIActivityViewController(activityItems: [dishesTitle, dishesCategory, dishesCusine, dishesProtein, dishesCarbohydrates, dishesCalories, openFullRecipe, url!], applicationActivities: nil)
        
        // keyWindowPresentedController is form extension of UIApplication
        UIApplication.shared.keyWindowPresentedController?.present(av, animated: true, completion: nil)
    }
    
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        
        // Image was pulled down
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        // Image was pulled down
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dishesData: QuickNEasy.quickNEasy[0])
    }
}

struct FavButton: View {
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color.red)
            .clipShape(Circle())
    }
}
