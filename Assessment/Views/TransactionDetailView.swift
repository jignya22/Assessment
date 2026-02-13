//
//  TransactionDetailView.swift
//  Assessment

import SwiftUI

struct TransactionDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isExpanded = false
    let transaction: Transaction
    
    private var isCredit: Bool { transaction.transactionType == .credit }
    
    var body: some View {
        ZStack {
            backgroundView
            contentView
        }
        .customNavTitle("Transaction Details", font: CustomFonts.pageTitle)
    }
    
    //MARK: View
    private var backgroundView: some View {
        Color(.page)
            .ignoresSafeArea()
    }
    
    private var contentView: some View {
        VStack {
            contentSection
            closeButton
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 3)
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }
    
    @ViewBuilder
    private var contentSection: some View {
        VStack(spacing: 18) {
            headerSection
            detailsSection
            tooltipSection
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var headerSection: some View {
        VStack(spacing: 14) {
            Image("success-icon")
                .imageScale(.large)
                .foregroundStyle(isCredit ? .green : .red)
                .accessibilityIdentifier("transactionIcon")
            
            Text(isCredit ? "Credit transaction" : "Debit transaction")
                .font(CustomFonts.transactionTitle)
                .foregroundStyle(.primary)
                .accessibilityIdentifier("transactionLabel")
        }
        .padding(.top, 18)
    }
    
    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            detailView(title: "From",
                       value: "\(transaction.fromAccount) (\(transaction.fromCardNumber.suffix(4)))")
            
            Divider()
            
            detailView(title: "Amount",
                       value: CurrencyFormatters.format(transaction.amount))
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
    
    private func detailView(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(CustomFonts.fieldLabel)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("fieldLabel")
            
            Text(value)
                .font(CustomFonts.fieldValue)
                .foregroundStyle(.primary)
                .accessibilityIdentifier("fieldValue")
        }
    }
    
    private var tooltipSection: some View {
        ToolTipView(
            isExpanded: $isExpanded,
            originalMessage: "Transactions are processed Monday to Friday (excluding holidays). ",
            expandedAdditional: "\n\nTransactions made before 8:30 pm ET Monday to Friday (excluding holidays) will show up in your account the same day. "
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var closeButton: some View {
        Button { dismiss() } label: {
            Text("Close")
                .font(CustomFonts.closeButton)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(Color(.redButton))
                .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .accessibilityIdentifier("closeButton")
        .accessibilityLabel("Close")
    }
}

#Preview("Detail") {
    NavigationStack {
        TransactionDetailView(transaction: sampleTransaction)
            .customNavTitle("Transaction Details", font: CustomFonts.pageTitle)
    }
}

private let sampleTransaction = Transaction(
    key: "tx_1",
    transactionType: .credit,
    merchantName: "Payroll Deposit",
    description: "Monthly salary",
    amount: Amount(value: 200.20, currency: "CAD"),
    postedDate: Date(),
    fromAccount: "Momentum Regular Visa",
    fromCardNumber: "8012"
)
