//
//  ExampleTest.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 23/10/21.
//

import SwiftUI

struct Filters: View {
    @State var tags: [Tag] = Tag.timeTags
    @State var isSelectedTime: String = ""
    
    @State var tags1: [Tag] = Tag.difficultTags
    @State var isSelectedLevel: String = ""
    
    @State var tags2: [Tag] = Tag.cusinesTags
    @State var isSelectedCusine: String = ""
    
    @State var tags3: [Tag] = Tag.healthTags
    @State var isSelectedHealth: String = ""
    
    @State var tags4: [Tag] = Tag.categoriesTags
    @State var isSelectedCat: String = ""
    
    var body: some View {
        ZStack {
            Color(hex: Colors.backgroundCol)
                .ignoresSafeArea(.all)
            VStack {
                Text(Texts.filter)
                    .font(.largeTitle).bold()
                
                //            Text("Hello")
                //                .onTapGesture {
                //                    isSelectedTime = ""
                //                    isSelectedLevel = ""
                //                    isSelectedCusine = ""
                //                    isSelectedHealth = ""
                //                    isSelectedCat = ""
                //                }
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(Texts.time)
                                .font(.largeTitle).bold()
                                .padding(.leading, 16)
                            
                            Spacer()
                            Image(systemName: Texts.trashIcon)
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isSelectedTime = ""
                                }
                        }
                        ChipButton(tags: $tags, isSelectedValue: $isSelectedTime)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(Texts.difficultyLevel)
                                .font(.largeTitle).bold()
                                .padding(.leading, 16)
                            
                            Spacer()
                            Image(systemName: Texts.trashIcon)
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isSelectedLevel = ""
                                }
                        }
                        ChipButton(tags: $tags1, isSelectedValue: $isSelectedLevel)
                    }
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
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(Texts.healthPreference)
                                .font(.largeTitle).bold()
                                .padding(.leading, 16)
                            
                            Spacer()
                            Image(systemName: Texts.trashIcon)
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isSelectedHealth = ""
                                }
                        }
                        ChipButton(tags: $tags3, isSelectedValue: $isSelectedHealth)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text(Texts.categories)
                                .font(.largeTitle).bold()
                                .padding(.leading, 16)
                            
                            Spacer()
                            Image(systemName: Texts.trashIcon)
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isSelectedCat = ""
                                }
                        }
                        ChipButton(tags: $tags4, isSelectedValue: $isSelectedCat)
                    }
                }
            }
        }
    }
}

struct Filters_Previews: PreviewProvider {
    static var previews: some View {
        Filters()
    }
}
