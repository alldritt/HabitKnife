//
//  CodableColor.swift
//  HabitKnife
//
//  Created by Mark Alldritt on 2025-02-05.
//

import SwiftUI

//  It turns out that encoding SwiftUI colors properly is exceedingly complex.  The solution
//  suggested at the link below for handling system and color assets works for my purposes and
//  avoids the problems I was struggling with.
//
//  https://nilcoalescing.com/blog/EncodeAndDecodeSwiftUIColor/
//

enum CodableColor: String, CaseIterable, Codable {
    case palette1
    case palette2
    case palette3
    case palette4
    case palette5
    case palette6
    case palette7
    case palette8
    case palette9
    case palette10
    case palette11
    case palette12
    case palette13
    case palette14
    case palette15
    case palette16
    case palette17
    case palette18
    case palette19
    case palette20
    case palette21
    
    init?(color: Color) {
        switch color {
        case .palette1: self = .palette1
        case .palette2: self = .palette2
        case .palette3: self = .palette3
        case .palette4: self = .palette4
        case .palette5: self = .palette5
        case .palette6: self = .palette6
        case .palette7: self = .palette7
        case .palette8: self = .palette8
        case .palette9: self = .palette9
        case .palette10: self = .palette10
        case .palette11: self = .palette11
        case .palette12: self = .palette12
        case .palette13: self = .palette13
        case .palette14: self = .palette14
        case .palette15: self = .palette15
        case .palette16: self = .palette16
        case .palette17: self = .palette17
        case .palette18: self = .palette18
        case .palette19: self = .palette19
        case .palette20: self = .palette20
        case .palette21: self = .palette21
        default: return nil
        }
    }

}


extension Color {
    init(codableColor: CodableColor) {
        switch codableColor {
        case .palette1: self = .palette1
        case .palette2: self = .palette2
        case .palette3: self = .palette3
        case .palette4: self = .palette4
        case .palette5: self = .palette5
        case .palette6: self = .palette6
        case .palette7: self = .palette7
        case .palette8: self = .palette8
        case .palette9: self = .palette9
        case .palette10: self = .palette10
        case .palette11: self = .palette11
        case .palette12: self = .palette12
        case .palette13: self = .palette13
        case .palette14: self = .palette14
        case .palette15: self = .palette15
        case .palette16: self = .palette16
        case .palette17: self = .palette17
        case .palette18: self = .palette18
        case .palette19: self = .palette19
        case .palette20: self = .palette20
        case .palette21: self = .palette21
        }
    }
}
