//
//  DevelopersView.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 21/12/21.
//

import SwiftUI

struct DevelopersView: View {
    @Namespace var animation
    
    @StateObject var developerDetailViewModel = DeveloperDetailViewModel()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("Developers")
                        .font(.largeTitle).bold()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                    
                    Spacer()
                    
                    DismissButton()
                        .opacity(developerDetailViewModel.show ? 0 : 1)
                }
                
                ScrollView {
                    VStack {
                        ForEach(developers) { developer in
                            DeveloperCard(dev: developer, animation: animation)
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                        developerDetailViewModel.selectedItem = developer
                                        developerDetailViewModel.show.toggle()
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.top, 40)
            .opacity(developerDetailViewModel.show ? 0 : 1)
            
            
            if developerDetailViewModel.show {
                DeveloperDetailView(developerDetailViewModel: developerDetailViewModel, animation: animation)
            }
        }
        .ignoresSafeArea()
    }
}

struct DevelopersView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopersView()
    }
}

struct DismissButton: View {
    @Environment(\.dismiss) var dismissMode
    @StateObject var hapticVM = HapticViewModel()
    
    var body: some View {
        GlassButton(iconName: "xmark", iconSize: 14)
            .padding(.trailing, 8)
            .onTapGesture {
                hapticVM.impact(style: .heavy)
                hapticVM.haptic(type: .warning)
                dismissMode()
            }
    }
}
