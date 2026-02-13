//
//  CustomModifier.swift
//  Assessment
//

import SwiftUI

struct CustomNavTitleModifier: ViewModifier {
    let title: String
    let titleFont: Font
    let titleColor: Color
    let background: Color
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(background, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(titleFont)
                        .foregroundStyle(titleColor)
                }
            }
    }
}
