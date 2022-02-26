//
//  LifeModel.swift
//  ForDemiurgeShambambukli
//
//  Created by Саша Гужавин on 25.02.2022.
//

import Foundation
import UIKit


struct LifeModel {
    let image: String
    let backgroundColor: [CGColor]
    let title: String
    let subTitle: String
}


struct Image {
    static let birth = "💥"
    static let skull = "💀"
    static let chick = "🐣"
}

struct Color {
    static let birth = [
        UIColor(red: 1, green: 0.72, blue: 0, alpha: 1).cgColor,
        UIColor(red: 1, green: 0.969, blue: 0.692, alpha: 1).cgColor
      ]
    static let skull = [
        UIColor(red: 0.052, green: 0.395, blue: 0.542, alpha: 1).cgColor,
        UIColor(red: 0.692, green: 1, blue: 0.704, alpha: 1).cgColor
      ]
    static let chick = [
        UIColor(red: 0.68, green: 0, blue: 1, alpha: 1).cgColor,
        UIColor(red: 1, green: 0.692, blue: 0.914, alpha: 1).cgColor
      ]
}

struct Title {
    static let birth = "Живая"
    static let skull = "Мертвая"
    static let chick = "Жизнь"
}

struct SubTitle {
    static let birth = "и шевелится!"
    static let skull = "или прикидывается"
    static let chick = "Ку-ку!"
}
