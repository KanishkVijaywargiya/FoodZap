//
//  NoScheduleFoodsView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 08/01/22.
//

import SwiftUI

struct NoScheduleFoodsView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    let tertiaryColor = Color("TertiaryColor")
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Do you want to schedule foods? Click on add button and add a bunch of items to your todo list!.")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: RecipeList()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? tertiaryColor : secondaryAccentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? tertiaryColor.opacity(0.7) : secondaryAccentColor.opacity(0.7), radius: animate ? 30 : 10, x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoScheduleFoodsView_Previews: PreviewProvider {
    static var previews: some View {
        NoScheduleFoodsView()
    }
}
