//
//  Extension.swift
//  Assessment
//

import SwiftUI

extension View {
    func customNavTitle(
        _ title: String,
        font: Font = CustomFonts.pageTitle,
        color: Color = .primary,
        background: Color = .white
    ) -> some View {
        modifier(CustomNavTitleModifier(
            title: title,
            titleFont: font,
            titleColor: color,
            background: background
        ))
    }
}
