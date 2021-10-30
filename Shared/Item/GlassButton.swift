//
//  GlassButton.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 30/10/21.
//

import SwiftUI

struct GlassButton: View {
    var iconName: String = "chevron.backward"
    
    var body: some View {
        Image(systemName: iconName)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(BlurView(style: .systemMaterialDark))
            .mask(Circle())
    }
}


struct GlassButton_Previews: PreviewProvider {
    static var previews: some View {
        GlassButton()
    }
}