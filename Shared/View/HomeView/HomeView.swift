//
//  ContentView.swift
//  Shared
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @AppStorage("name") var name = ""
    @StateObject var quickNEasyVM = QuickNEasyViewModel()
    @StateObject var RecipeListVM = RecipeListViewModel()
    @StateObject var hapticVM = HapticViewModel()
    @State var viewAppeared = false
    @State var profileImage: UIImage = retrieveImage(forKey: "ProfileImage", inStorageType: .userDefaults)
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            
//            if (RecipeListVM.recipeList.count > 0 && quickNEasyVM.quickNEasy.count > 0) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        // hello username
                        helloUsername(title: name)
                        
                        // title, search, profile button
                        HStack(spacing: 0) {
                            Text("Quick & Easy")
                                .font(.largeTitle).bold()
                                .padding(.horizontal, 20)
                                .padding(.bottom, 16)
                            
                            Spacer()
                            
                            ProfileButton(profileImg: $profileImage)
                                .onTapGesture {
                                    hapticVM.impact(style: .soft)
                                    hapticVM.haptic(type: .success)
                                    withAnimation(Animation.easeInOut(duration: 0.2)) {
                                        self.viewAppeared = true
                                    }
                                }
                        }
                        
                        // horizontal scroll cards
                        QuickAndEasy(quickNEasyData: quickNEasyVM.quickNEasy)
                        
                        NavigationLink(destination: RecipeList()) {
                            SeeMoreButton()
                        }.buttonStyle(FlatLinkStyle())
                        // ca-app-pub-3940256099942544/2934735716
                        // Orig: ca-app-pub-7244548441023789/8094137541
                        BannerAd(unitID: "ca-app-pub-3940256099942544/2934735716")
                        
                        // Indian specials
                        WorldCusines(recipeData: RecipeListVM.recipeList)
                        
                        NavigationLink(destination: RecipeList()) {
                            SeeMoreButton().padding(.top, 26)
                        }.buttonStyle(FlatLinkStyle())
                        Spacer()
                    }
                }
                .navigationBarHidden(true)
//            }
//            else {
//                    ProgressView()
//                        .scaleEffect(1, anchor: .center)
//                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
//                }
                
            }
            
                .fullScreenCover(isPresented: $viewAppeared) {
                    ProfileView(saveName: $name, imageSelected: $profileImage)
                        .animation(Animation.spring(), value: name)
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    struct helloUsername: View {
        var title: String = ""
        
        var body: some View {
            Text("Hello \(title)")
                .font(Font.headline.bold())
                .padding(.top)
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
        }
    }
