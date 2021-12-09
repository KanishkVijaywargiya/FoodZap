//
//  ProfileView.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 09/12/21.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var hapticVM = HapticViewModel()
    @AppStorage("name") var name = ""
    @Binding var saveName: String
    let textLimit = 20 //Your limit
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol)
            
            VStack(alignment: .center, spacing: 10) {
                Image(systemName: "plus.viewfinder")
                    .font(.system(size: 200))
                    .foregroundColor(Color(hex: "#FCB6B6"))
                
                TextField("Enter your name", text: $saveName)
                    .foregroundColor(.black.opacity(0.7))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 1)
                            .blendMode(.overlay)
                    )
                    .onReceive(Just(saveName)) { _ in limitText(textLimit) }
            }
            .padding()
            .padding(.top, 50)
            
            GlassButton(iconName: "square.and.arrow.down.fill", iconSize: 16)
                .padding(.trailing, 8)
                .padding(.top, 45)
                .onTapGesture {
                    hapticVM.impact(style: .heavy)
                    hapticVM.haptic(type: .warning)
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .ignoresSafeArea()
    }
    
    func limitText(_ upper: Int) {
        if saveName.count > upper {
            saveName = String(saveName.prefix(upper))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(saveName: .constant(""))
    }
}
