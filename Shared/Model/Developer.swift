//
//  Developer.swift
//  FoodZap
//
//  Created by MANAS VIJAYWARGIYA on 21/12/21.
//

import Foundation

struct Developer: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var instaHandle: String
    var profileImg: String
    var logo: String
    var hello: String
    var description: String
}

var developers = [
    Developer(name: "Manas Vijaywargiya", category: "iOS Developer", instaHandle: "https://www.instagram.com/manas_iosdev/", profileImg: "mengto", logo: "mengto",hello: "Hello there 👋🏻!", description: "I’m a Professional iOS Developer, I love writing code. I have started off my career as a self taught iOS developer.\n\nDevelopment is a never ending puzzle that I am passionately engaged in solving. I believe in the power of programming to transform and improve the lives of people around the world."),
    
    Developer(name: "Kanishk Vijaywargiya", category: "Developer + Designer", instaHandle: "https://www.instagram.com/kanishk._.vijaywargiya/", profileImg: "swiftuilogo", logo: "swiftuilogo", hello: "Hola 👋🏻", description: "I’m a Professional Developer + Gamer. I love to create, develop & design the things with my imagination along with power of code. I am a self taught Designer. Designing is my piece of cake. I love to play sports like badminton, chess & E-Sports.\n\nI am continuously working towards making the technology reachable to everyone who needs it!\n\nBuy me a Coffee ☕️…")
]
