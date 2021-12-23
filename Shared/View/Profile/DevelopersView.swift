//
//  DevelopersView.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 21/12/21.
//

import SwiftUI

struct DevelopersView: View {
    //    @Namespace var animation
    @StateObject var developerDetailViewModel = DeveloperDetailViewModel()
    @StateObject var hapticVM = HapticViewModel()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol)
            
            //            VStack(alignment: .leading) {
            ScrollView {
//                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Developers")
                            .font(.largeTitle).bold()
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        DismissButton()
                        //                        .opacity(developerDetailViewModel.show ? 0 : 1)
                    }
                    .padding(.top, 50)
                    
                    LazyVGrid(columns: [GridItem()], content: {
                        ForEach(developers) { developer in
                            DeveloperCard(dev: developer)
                                .onTapGesture {
                                    hapticVM.impact(style: .soft)
                                    hapticVM.haptic(type: .success)
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6)) {
                                        developerDetailViewModel.selectedItem = developer
                                        developerDetailViewModel.show.toggle()
                                    }
                                }
                        }
                    })
//                }
            }
            //            }
            //            .padding(.top, 80)
            //            .opacity(developerDetailViewModel.show ? 0 : 1)
            
            
            //            if developerDetailViewModel.show {
            //                DeveloperDetailView(developerDetailViewModel: developerDetailViewModel, animation: animation)
            //            }
        }
        .fullScreenCover(isPresented: $developerDetailViewModel.show, content: {
            DeveloperDetailView(developerDetailViewModel: developerDetailViewModel)
        })
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
            .padding(.trailing, 16)
            .onTapGesture {
                hapticVM.impact(style: .heavy)
                hapticVM.haptic(type: .warning)
                dismissMode()
            }
    }
}
