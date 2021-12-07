//
//  OnBoardingScrollVIew.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 07/12/21.
//

import SwiftUI

struct OnBoardingScrollView: View {
    @AppStorage("currentPage") var currentPage = 0
    
    @EnvironmentObject var appModel: AppModel
    @Binding var backgroundColor: Color
    @StateObject var hapticVM = HapticViewModel()
    
    @State var viewAppeared = false
    @State var nextButtonScale: CGFloat = 0
    @State var viewOffset: CGFloat = 0
    
    let persistenceController = PersistenceController.shared
    let appWidth: CGFloat = UIScreen.main.bounds.width
    let appHeight: CGFloat = UIScreen.main.bounds.height
    let detectDirectionalDrags = DragGesture(minimumDistance: 0, coordinateSpace: .local)
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                HStack(spacing: 0) {
                    ForEach(Array(zip(appModel.onBoardingData.indices, appModel.onBoardingData)), id: \.0) {(ix, onBoardingData) in
                        OnboardingPage(selectedIndex: $appModel.currentStep, appModel: appModel, onboardingData: onBoardingData, step: ix)
                            .frame(width: appWidth)
                    }
                }
                .offset(x: viewOffset)
            }
            
            HStack {
                if(appModel.currentStep >= 1) {
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                        backwardPage()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.black)
                            .font(.system(size: 22, weight: .medium))
                            .opacity(0.4)
                    }
                    .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                NextButton(background: $backgroundColor)
                    .environmentObject(appModel)
                    .onTapGesture {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                        forwardPage()
                    }
                    .scaleEffect(nextButtonScale)
            }
            .padding([.leading, .trailing], 24)
            .offset(y: appHeight / 2 - 130)
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                nextButtonScale = 0.9
            }
        }
        .fullScreenCover(isPresented: $viewAppeared) {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .foregroundColor(.black)
        }
    }
    
    func forwardPage() {
        if(!appModel.animationInProgress) {
            self.appModel.forward = true
            self.appModel.animationInProgress = true
            
            appModel.previousColor = appModel.onBoardingData[appModel.currentStep].associatedColor
            
            if(appModel.currentStep + 1 <= appModel.onBoardingData.count - 1) {
                appModel.currentStep += 1
            } else {
                appModel.currentStep = appModel.onBoardingData.count - 1
                
                checkLastScreen()
            }
            
            self.backgroundColor = appModel.onBoardingData[appModel.currentStep].associatedColor
            
            animateColor()
            
            self.appModel.addStep()
            
            withAnimation(Animation.easeOut(duration: appModel.animationDuration)) {
                self.viewOffset = -appWidth * CGFloat(appModel.currentStep)
            }
        }
    }
    
    func backwardPage() {
        if(!appModel.animationInProgress) {
            self.appModel.animationInProgress = true
            self.appModel.forward = false
            
            appModel.previousColor = appModel.onBoardingData[appModel.currentStep].associatedColor
            
            appModel.removeStep(step: appModel.currentStep)
            
            if(appModel.currentStep - 1 >= 0) {
                appModel.currentStep -= 1
            } else {
                appModel.currentStep = 0
            }
            
            self.backgroundColor = appModel.onBoardingData[appModel.currentStep].associatedColor
            
            animateColor()
            
            withAnimation(Animation.easeOut(duration: appModel.animationDuration)) {
                if(appModel.currentStep == 1) {
                    self.viewOffset = -appWidth
                } else {
                    self.viewOffset = 0
                }
            }
        }
    }
    
    func animateColor() {
        appModel.scale = 0
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(Animation.spring(response: appModel.animationDuration).speed(0.65)) {
                appModel.scale = 8.5
            }
        }
    }
    
    func checkLastScreen() {
        self.viewAppeared = true
        currentPage = 4
    }
}

struct OnBoardingScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Image(AppModel().onBoardingData[0].bgImage)
                .resizable()
                .ignoresSafeArea()
            OnBoardingScrollView(backgroundColor: .constant(.yellow))
                .environmentObject(AppModel())
        }
    }
}
