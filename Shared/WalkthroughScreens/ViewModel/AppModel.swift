//
//  AppModel.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 07/12/21.
//

import SwiftUI

class AppModel: ObservableObject {
    @Published var onBoardingData: [OnBoardingMetaData] = [
        OnBoardingMetaData(bgImage: "walkthrough1", imageName: "onboardImage1", title: "First time cooking ? No\nworries foodzap is here to\nhelp you.", imageOffset: 0, associatedColor: Color(hex: "#FAE200")),
        
        OnBoardingMetaData(bgImage: "walkthrough2", imageName: "onboardImg2", title: "Browse and plan your\nweekly meal with foodzap", imageOffset: -24, associatedColor: Color(hex: "#75CEDE"), imageScale: 1.2),
        
        OnBoardingMetaData(bgImage: "walkthrough1", imageName: "onboardImg3", title: "Create your shopping list.\nExperience the power of the\n#1 meal cooking app.", imageOffset: 0, associatedColor: Color(hex: "#F75564"), imageScale: 1.2)
    ]
    
    @Published var previousColor: Color = Color.green
    @Published var passedSteps: [Int] = [0]
    @Published var currentStep = 0 {
        didSet {
            Timer.scheduledTimer(withTimeInterval: animationDuration * 1.5, repeats: false) { _ in
                self.animationInProgress = false
            }
        }
    }
    
    @Published var scale: CGFloat = 0
    @Published var animationInProgress = false
    @Published var forward = true
    
    let animationDuration: TimeInterval = 0.5
    
    init() {
        previousColor = onBoardingData[0].associatedColor
    }
    
    func addStep() {
        self.passedSteps.append(self.currentStep)
    }
    
    func removeStep(step: Int) {
        self.passedSteps = self.passedSteps.filter {
            $0 != step
        }
    }
    
    func skip() {
        
    }
}
