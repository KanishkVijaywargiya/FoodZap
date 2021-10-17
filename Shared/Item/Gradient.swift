//
//  Gradient.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

func LinearGradient(grad1: Color, grad2: Color, grad3: Color) -> some View {
    LinearGradient(
        gradient: Gradient(stops: [
            .init(color: grad1, location: 0),
            .init(color: grad2, location: 0.62),
            .init(color: grad3, location: 1)
        ]),
        startPoint: .bottomTrailing,
        endPoint: .topLeading
    )
}

