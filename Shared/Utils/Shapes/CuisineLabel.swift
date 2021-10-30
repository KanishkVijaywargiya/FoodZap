//
//  cuisineBanner.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 25/10/21.
//

import SwiftUI

struct CuisineLabel: View {
    var colorBg: String = "#AFAFAF"
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 180, y: 0))
                path.addLine(to: CGPoint(x: 180, y: -32))
                path.addLine(to: CGPoint(x: 0, y: -32))
            }
            .fill(Color(hex: colorBg))
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 30, y: -16))
                path.addLine(to: CGPoint(x: 0, y: -32))
            }
            .fill(Color.white)
        }
    }
}

struct CuisineLabel_Previews: PreviewProvider {
    static var previews: some View {
        CuisineLabel()
            .frame(width: 1, height: 1)
    }
}
