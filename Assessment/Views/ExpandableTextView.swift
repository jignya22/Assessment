//
//  ExpandableView.swift
//  Assessment
//

import Foundation
import SwiftUI

struct ExpandableTextView: View {
    @Binding var isExpanded: Bool
    let originalMessage: String
    let expandedAdditional: String

    var body: some View {
        Text(makeAttributedText())
            .font(CustomFonts.tooltipText)
            .foregroundStyle(.primary)
            .accessibilityIdentifier("textviewExpandable")
            .environment(\.openURL, OpenURLAction { url in
                if url.scheme == "toggle" {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                    return .handled
                }
                return .systemAction
            })
    }

    private func makeAttributedText() -> AttributedString {
        var result = AttributedString(originalMessage)

        if isExpanded {
            result += AttributedString(expandedAdditional)
        }

        var linkPart = AttributedString(isExpanded ? "Show less" : "Show more")
        linkPart.link = URL(string: "toggle://more")
        linkPart.foregroundColor = UIColor(named: "blueText")
        linkPart.font = CustomFonts.tooltipLink
        
        result += linkPart
        return result
    }
}
