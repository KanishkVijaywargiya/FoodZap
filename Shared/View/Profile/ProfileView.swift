//
//  ProfileView.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 09/12/21.
//

import SwiftUI
import Combine // for textLimit in textField

enum CameraType {
    case camera, photoLibrary
}

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var hapticVM = HapticViewModel()
    @AppStorage("name") var name = ""
    @Binding var saveName: String
    let textLimit = 20 //Your limit
    
    @State var openActionSheet = false
    // for image picker
    @State var openCameraRoll = false
    @State var cameraType: CameraType = .photoLibrary
    @Binding var imageSelected: UIImage
    
    @State private var openDeveloperSheet: Bool = false
    
    var divider: some View {
        Divider().background(Color.white).blendMode(.overlay)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(hex: Colors.backgroundCol)
            
            VStack(alignment: .leading) {
                VStack(alignment: .center, spacing: 10) {
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                        self.openActionSheet.toggle()
                    }) {
                        ZStack {
                            if imageSelected == UIImage() {
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .font(.system(size: 120))
                                    .foregroundColor(Color(hex: "#FCB6B6"))
                            } else {
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.bottom)
                    
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
                
                Text("Bio")
                    .font(.custom("American Typewriter", size: 22))
                    .padding(.top, 8)
                    .padding(.horizontal, 30)
                
                VStack {
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                    }) {
                        MenuRow(title: "About", leftIcon: "ellipsis.bubble")
                    }
                    divider
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                    }) {
                        MenuRow(title: "Rate this app", leftIcon: "star")
                    }
                    divider
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                    }) {
                        MenuRow(title: "Share this app", leftIcon: "square.and.arrow.up")
                    }
                    divider
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                        self.openDeveloperSheet.toggle()
                    }) {
                        MenuRow(title: "The Developer", leftIcon: "signature")
                    }
                    divider
                    Button(action: {
                        hapticVM.impact(style: .soft)
                        hapticVM.haptic(type: .success)
                    }) {
                        MenuRow(title: "Donate", leftIcon: "heart")
                    }
                }
                .blurBackground()
                .padding(.top, 8)
                .padding(.horizontal, 20)
            }
            
            GlassButton(iconName: "square.and.arrow.down.fill", iconSize: 14)
                .padding(.trailing, 8)
                .padding(.top, 45)
                .onTapGesture {
                    hapticVM.impact(style: .heavy)
                    hapticVM.haptic(type: .warning)
                    DispatchQueue.global(qos: .background).async {
                        guard let image = imageSelected as UIImage? else { return }
                        store(image: image, forKey: "ProfileImage", withStorageType: .userDefaults)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $openCameraRoll, onDismiss: loadImage) {
            if cameraType == .camera {
                ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
            } else {
                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
            }
        }
        .confirmationDialog("What do you want to open ?", isPresented: $openActionSheet) {
            Button(action: {
                openCameraRoll = true
                cameraType = .camera
            }) {
                Text("Camera")
            }
            Button(action: {
                openCameraRoll = true
                cameraType = .photoLibrary
            }) {
                Text("Photo Gallery")
            }
            Button("Cancel", role: .cancel) {
                openActionSheet = false
            }
        } message: {
            Text("What do you want to open?")
        }
        .fullScreenCover(isPresented: $openDeveloperSheet) {
            DevelopersView()
        }
    }
    
    func limitText(_ upper: Int) {
        if saveName.count > upper {
            saveName = String(saveName.prefix(upper))
        }
    }
    
    func loadImage() {
        guard let _ = imageSelected as UIImage? else { return }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(saveName: .constant(""), imageSelected: .constant(UIImage()))
    }
}
