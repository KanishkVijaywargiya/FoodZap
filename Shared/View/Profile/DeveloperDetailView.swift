//
//  DeveloperDetailView.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 21/12/21.
//

import SwiftUI
import MessageUI

struct DeveloperDetailView: View {
    @ObservedObject var developerDetailViewModel: DeveloperDetailViewModel
    @StateObject var hapticVM = HapticViewModel()
    //    var animation: Namespace.ID
    
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(developerDetailViewModel.selectedItem.profileImg)
                            .resizable()
                            .scaledToFill()
                        //                        .matchedGeometryEffect(id: developerDetailViewModel.selectedItem.profileImg, in: animation)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                        
                        HStack {
                            
                            Spacer(minLength: 0)
                            
                            GlassButton(iconName: "xmark", iconSize: 14)
                                .padding(.trailing, 8)
                                .padding(.top, 45)
                                .onTapGesture {
                                    hapticVM.impact(style: .soft)
                                    hapticVM.haptic(type: .success)
                                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.9)) {
                                        developerDetailViewModel.show.toggle()
                                    }
                                }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 16)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(developerDetailViewModel.selectedItem.name)
                                .font(.custom("American Typewriter", size: 15).bold())
                                .frame(maxWidth: 250, alignment: .leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                                .padding(.top, 16)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                            
                            Text(developerDetailViewModel.selectedItem.category)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 12)
                                .lineLimit(1)
                        }
                        
                        Image(developerDetailViewModel.selectedItem.logo)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(15)
                            .padding(.trailing, 16)
                        
                    }
                    .padding(.top, 20)
                    //                .matchedGeometryEffect(id: developerDetailViewModel.selectedItem.id, in: animation)
                    
                    Text(developerDetailViewModel.selectedItem.hello)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    Text(developerDetailViewModel.selectedItem.description)
                        .font(.custom("American Typewriter", size: 15))
                        .padding()
                    
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            hapticVM.impact(style: .soft)
                            hapticVM.haptic(type: .success)
                        }) {
                            Text("Support me")
                                .foregroundColor(.green)
                                .frame(width: 200)
                        }
                        .tint(.green)
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        
                        Spacer()
                        
                        Button(action: {
                            hapticVM.impact(style: .soft)
                            hapticVM.haptic(type: .success)
                            let url = URL(string: developerDetailViewModel.selectedItem.instaHandle)!
                            let application = UIApplication.shared
                            // Check if the instagram App is installed
                            if application.canOpenURL(url) {
                                application.open(url)
                            } else {
                                // If Instagram App is not installed, open Safari with Instagram Link
                                application.open(url)
                            }
                        }) {
                            Image("insta")
                                .resizable()
                                .frame(width: 40, height: 35, alignment: .center)
                        }
                        .padding(.trailing, 6)
                        
                        Button(action: {
                            hapticVM.impact(style: .soft)
                            hapticVM.haptic(type: .success)
                            if MFMailComposeViewController.canSendMail() {
                                self.isShowingMailView = true
                            } else {
                                print("Error sending mail")
                                // Alert : Unable to send the mail
                            }
                        }) {
                            Image(systemName: "bubble.left")
                                .font(.system(size: 30))
                                .foregroundColor(.brown)
                        }
                    }
                    .padding()
                }
            }
            .ignoresSafeArea(.all)
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$result, newSubject: "FoodZap | Feedback")
            }
        }
        .ignoresSafeArea()
    }
}

struct DeveloperDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        DeveloperDetailView(developerDetailViewModel: DeveloperDetailViewModel())
    }
}
