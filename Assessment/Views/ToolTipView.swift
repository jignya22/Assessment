//
//  ToolTipView.swift
//  Assessment
//

import SwiftUI

struct ToolTipView: View {
    @Binding var isExpanded: Bool
    let originalMessage: String
    let expandedAdditional: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 12) {
                Image("buddy_tip")
                    .imageScale(.large)
                    .accessibilityIdentifier("tooltipIcon")
                
                ExpandableTextView(isExpanded: $isExpanded, originalMessage: originalMessage, expandedAdditional: expandedAdditional)

                Spacer(minLength: 0)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(.systemBackground)).stroke(Color.gray.opacity(0.2), lineWidth: 0.8)
            )
        }
        .padding(25)
        .accessibilityIdentifier("tooltipCard")
    }
}
