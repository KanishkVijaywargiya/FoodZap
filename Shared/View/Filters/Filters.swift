//
//  ExampleTest.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 23/10/21.
//

import SwiftUI

struct Filters: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var tags: [Tag] = Tag.timeTags
    @Binding var isSelectedTime: String
    
    @State var tags1: [Tag] = Tag.difficultTags
    @Binding var isSelectedLevel: String
    
    @State var tags2: [Tag] = Tag.cusinesTags
    @Binding var isSelectedCusine: String
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        isSelectedTime = ""
                        isSelectedLevel = ""
                        isSelectedCusine = ""
                    }) {
                        Text("Cancel")
                    }
                    .padding(.leading, 16)
                    .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text(Texts.filter)
                        .font(.largeTitle).bold()
                    
                    Spacer()
                    
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Text("Done")
                    }
                    .padding(.trailing, 16)
                    .foregroundColor(.blue)
//                    .disabled(
//                        (isSelectedTime.isEmpty || isSelectedLevel.isEmpty || isSelectedCusine.isEmpty) ? true : false
//                    )
                }
                ScrollView {
//                    VStack(alignment: .leading, spacing: 0) {
//                        HStack {
//                            Text(Texts.time)
//                                .font(.largeTitle).bold()
//                                .padding(.leading, 16)
//                            
//                            Spacer()
//                            Image(systemName: Texts.trashIcon)
//                                .padding(.trailing, 25)
//                                .onTapGesture {
//                                    isSelectedTime = ""
//                                }
//                        }
//                        ChipButton(tags: $tags, isSelectedValue: $isSelectedTime)
//                    }
//                    VStack(alignment: .leading, spacing: 0) {
//                        HStack {
//                            Text(Texts.difficultyLevel)
//                                .font(.largeTitle).bold()
//                                .padding(.leading, 16)
//                            
//                            Spacer()
//                            Image(systemName: Texts.trashIcon)
//                                .padding(.trailing, 25)
//                                .onTapGesture {
//                                    isSelectedLevel = ""
//                                }
//                        }
//                        ChipButton(tags: $tags1, isSelectedValue: $isSelectedLevel)
//                    }
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(Texts.cusines)
                                .font(.largeTitle).bold()
                                .padding(.leading, 16)
                            
                            Spacer()
                            Image(systemName: Texts.trashIcon)
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isSelectedCusine = ""
                                }
                        }
                        ChipButton(tags: $tags2, isSelectedValue: $isSelectedCusine)
                    }
                }
            }
        }
        
    }
}

//struct Filters_Previews: PreviewProvider {
//    static var previews: some View {
//        Filters()
//    }
//}
