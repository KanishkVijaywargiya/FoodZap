//
//  DeveloperDetailViewModel.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 21/12/21.
//

import SwiftUI

class DeveloperDetailViewModel: ObservableObject {
    @Published var selectedItem = Developer(name: "", category: "", instaHandle: "", profileImg: "", logo: "",hello: "",description: "")
    
    @Published var show = false
    
    
}

