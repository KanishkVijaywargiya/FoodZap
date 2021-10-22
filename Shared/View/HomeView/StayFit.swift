//
//  StayFit.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

struct StayFit: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text("Health is Wealth")
                    .font(.title).bold()
                .padding(.horizontal, 20)
                
                Spacer()
                
                Text("See all")
                .padding(.horizontal, 20)
            }
//            .padding(.top, )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 180), spacing: 16)], spacing: 16) {
                ForEach(DummyData.dummyData) { item in
                    VStack {
                        NavigationLink(destination: Text("Destination")) {
                            Cards(dummyData: item)
                                .frame(height: 250)
                        }
                    }
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
    }
}

struct StayFit_Previews: PreviewProvider {
    static var previews: some View {
        StayFit()
    }
}