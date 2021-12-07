//
//  OnboardingPage.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 07/12/21.
//

import SwiftUI

struct OnboardingPage: View {
    @State var viewAppeared = false
    @Binding var selectedIndex: Int
    @StateObject var appModel: AppModel
    
    let onboardingData: OnBoardingMetaData
    var step: Int
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            VStack(alignment: .center) {
                Image(onboardingData.imageName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(onboardingData.imageScale)
                    .offset(y: onboardingData.imageOffset)
                    .frame(width: 350, height: 350)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                VStack(alignment: .center) {
                    Text(onboardingData.title)
                        .foregroundColor(.black)
                        .font(.custom("American Typewriter", size: 22).bold())
                        .shadow(color: Color(hex: "C0C0C0").opacity(0.4), radius: 5)
                        .opacity(self.viewAppeared ? 1 : 0)
                        .offset(y: self.viewAppeared ? 0 : -100)
                        .frame(height: self.viewAppeared ? 150 : CGFloat.zero, alignment: .center)
                        .frame(minHeight: 150)
                        .multilineTextAlignment(.center)
                        .animation(Animation.spring(response: 0.5, dampingFraction: 0.7).delay(0.25))
                }
            }
        }
        .onAppear {
            showOrHideView()
        }
    }
    
    func showOrHideView() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if(!viewAppeared && appModel.currentStep == step) {
                animate()
            } else if(viewAppeared && appModel.currentStep != step) {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    hide()
                }
            }
        }
    }
    
    func animate() {
        self.viewAppeared = true
    }
    
    func hide() {
        self.viewAppeared = false
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Image(AppModel().onBoardingData[0].bgImage)
                .resizable()
                .ignoresSafeArea()
            OnboardingPage(selectedIndex: .constant(0), appModel: AppModel(), onboardingData: AppModel().onBoardingData[1], step: 0)
        }
    }
}
