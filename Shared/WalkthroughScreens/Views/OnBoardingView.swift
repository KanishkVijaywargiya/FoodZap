//
//  OnBoardingView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 07/12/21.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("currentPage") var currentPage = 0
    
    @StateObject var appModel: AppModel = AppModel()
    @StateObject var hapticVM = HapticViewModel()
    @State var background: Color
    @State var viewAppeared = false
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            appModel.previousColor
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height

                ZStack {
                    /// left
                    if(!appModel.forward) {
                        Circle()
                            .scale(appModel.scale)
                            .foregroundColor(background)
                            .frame(width: 200, height: 200)
                            .offset(x: 12, y: height * 0.775)
                    }
                    
                    /// right
                    if(appModel.forward) {
                        ZStack {
                            Circle()
                                .scale(appModel.scale)
                                .foregroundColor(background)
                                .frame(width: 200, height: 200)
                            
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
                                .foregroundColor(.white.opacity(0.5))
                                .blur(radius: 6)
                                .frame(width: 200, height: 200)
                                .scaleEffect(appModel.scale)
                                .animation(Animation.easeInOut(duration: 0.2).delay(0.2))
                        }
                        .offset(x: width * 0.6, y: height * 0.775)
                    }
                }
            }
            
            OnBoardingScrollView(backgroundColor: $background)
                .environmentObject(appModel)
                .padding(.top, 100)
            
            HStack {
                Spacer()
                if(appModel.currentStep < 2) {
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                        withAnimation(Animation.easeInOut(duration: 0.2)) {
                            currentPage = 4
                            self.viewAppeared = true
                        }
                    }) {
                        Text("Skip")
                    }
                    .font(.custom("American Typewriter", size: 15).bold())
                    .foregroundColor(.black)
                    .frame(width: 75, height: 28, alignment: .center)
                    .background(Color.white.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22, style: .continuous)
                            .stroke(Color(#colorLiteral(red: 0.8442999721, green: 0.8311249614, blue: 0.8308337331, alpha: 1)), lineWidth: 1)
                    )
                }
            }
            .padding(16)
        }
        .onAppear {
            self.background = self.appModel.previousColor
        }
        .fullScreenCover(isPresented: $viewAppeared) {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .foregroundColor(.black)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(background: .green)
    }
}
