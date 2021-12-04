//
//  HapticViewModel.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 04/12/21.
//

import SwiftUI

class HapticViewModel: ObservableObject {
    func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
}
