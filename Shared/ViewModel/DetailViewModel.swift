//
//  DetailViewModel.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 27/11/21.
//

import Foundation
import SwiftUI
import Firebase

class DetailViewModel: ObservableObject {
    @Published var isFav = false
    
    func myFavReceipes(_ favEnum: FavType, of reciepeId: String?) {
        guard let recId = reciepeId else { return }
        if favEnum == .quickFav {
            QUICK_AND_EASY.document(recId).updateData(["isFav" : true]) {_ in
                self.isFav = true
            }
        } else {
            RECIPE_LIST.document(recId).updateData(["isFav" : true]) {_ in
                self.isFav = true
            }
        }
    }
    
    func removeFavReceipes(_ favEnum: FavType, of reciepeId: String?) {
        guard let recId = reciepeId else { return }
        if favEnum == .quickFav {
            QUICK_AND_EASY.document(recId).updateData(["isFav" : false]) {_ in
                self.isFav = false
            }
        } else {
            RECIPE_LIST.document(recId).updateData(["isFav" : false]) {_ in
                self.isFav = false
            }
        }
    }
}
