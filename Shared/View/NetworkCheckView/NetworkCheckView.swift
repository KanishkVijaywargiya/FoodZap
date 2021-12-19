//
//  NetworkCheckView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 19/12/21.
//

import SwiftUI
import AwesomeToast

struct NetworkCheckView: View {
    @StateObject var hapticVM = HapticViewModel()
    @State private var showToast = false
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol).ignoresSafeArea()
            
            VStack {
                Image("face")
                    .resizable()
                    .scaledToFit()
                
                Text("No Internet Connection")
                    .font(.custom("American Typewriter", size: 22).bold())
                
                Text("You are not connected to the internet. Make sure Wi-Fi is on, Airplane Mode is off and try again.")
                    .font(.custom("American Typewriter", size: 18))
                    .padding(.horizontal)
                    .padding(.top, 2)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    self.showToast = true
                    hapticVM.impact(style: .heavy)
                    hapticVM.haptic(type: .warning)
                }) {
                    Text("Retry")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.green)
                }
                .tint(.green)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.regular)
                .padding()
            }
        }
        .showToast(title: "No Internet Connection", "Please enable WiFi or Cellular data", isPresented: $showToast, color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), duration: 4, alignment: .top, toastType: .offsetToast, image: Image(systemName: "wifi.slash"))
    }
}

struct NetworkCheckView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCheckView()
    }
}
