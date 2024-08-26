//
//  Color-Theme.swift
//  Moonshot_Project8
//
//  Created by Jesse Sheehan on 8/23/24.
//

import SwiftUI

//extends the ShapeStyle protocol - but ONLY when it's used as a color!
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
