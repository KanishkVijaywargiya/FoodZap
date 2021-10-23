//
//  ChipButton.swift
//  FoodZap (iOS)
//
//  Created by MANAS VIJAYWARGIYA on 23/10/21.
//

import SwiftUI

struct ChipButton: View {
    @Binding var tags: [Tag]
    @Binding var isSelectedValue: String

    @State private var totalHeight = CGFloat.zero
        
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
            
            Text("Hello \(isSelectedValue)")
                .padding(.top, 150)
                .onTapGesture {
                    isSelectedValue = ""
                }
        }
        .frame(height: totalHeight)
        .padding(8)
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return ZStack(alignment: .topLeading) {
            ForEach(tags.indices) { index in
                Text(tags[index].title)
                    .padding([.horizontal, .vertical], 4)
                    .foregroundColor((tags[index].title == isSelectedValue) ? .white : .black)
                    .padding()
                    .lineLimit(1)
                    .background((tags[index].title == isSelectedValue) ? Color.blue : Color.white)
                    .frame(height: 36)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke((tags[index].title == isSelectedValue) ? Color.blue : Color.black, lineWidth: 1.5)
                    )
                    .padding([.horizontal], 8)
                    .padding([ .vertical], 6)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tags[index].title == self.tags.last!.title {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tags[index].title == self.tags.last!.title {
                            height = 0 // last item
                        }
                        return result
                    }).onTapGesture {
                        isSelectedValue = tags[index].title
                    }
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

//struct ChipButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ChipButton()
//    }
//}


// let arrFilter = tags.filter({ $0 == tags[index] })
// let indexVals = tags.firstIndex(of: tags[index])!
