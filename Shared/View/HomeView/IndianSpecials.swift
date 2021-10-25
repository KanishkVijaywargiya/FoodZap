//
//  IndianSpecials.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct IndianSpecials: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Indian Specials")
                .font(.title).bold()
                .padding(.horizontal, 20)
            
            LazyVStack {
                ForEach(DummyData.dummyData) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: Text("Destination")) {
                            BigCards(dummyData: item)
                                .frame(height: 350)
                        }
                    }
                }
            }
        }
    }
}

struct IndianSpecials_Previews: PreviewProvider {
    static var previews: some View {
        IndianSpecials()
    }
}
