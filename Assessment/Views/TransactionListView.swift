//
//  TransactionListView.swift
//  Assessment

import SwiftUI

struct TransactionListView: View {
    @StateObject var viewModel: TransactionListViewModel
    @State private var selected: Transaction?

    var body: some View {
        NavigationStack {
            content
                .customNavTitle("Transactions", font: CustomFonts.pageTitle)
                .task { await viewModel.loadTransactions() }
        }
    }
    
    //MARK: View

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            loadingView
        } else if let message = viewModel.errorMessage {
            errorView(message: message)
        } else {
            listView
        }
    }
    
    private var loadingView: some View {
        ProgressView("Loading...")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    private func errorView(message: String) -> some View {
        VStack(spacing: 12) {
            Text(message)
                .multilineTextAlignment(.center)
            
            Button("Retry") {
                Task { await viewModel.loadTransactions() }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    private var listView: some View {
        List(viewModel.transactions) { transaction in
            NavigationLink {
                TransactionDetailView(transaction: transaction)
            } label: {
                TransactionRowView(transaction: transaction)
            }
            .buttonStyle(.plain)
        }
        .listStyle(.plain)
        .accessibilityIdentifier("transactionsList")
    }
}

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(transaction.merchantName)
                .font(CustomFonts.fieldValue)
                .accessibilityIdentifier("\(transaction.merchantName)-\(transaction.id)")
            
            if let desc = transaction.description, !desc.isEmpty {
                Text(desc)
                    .font(CustomFonts.fieldLabel)
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier("\(desc)-\(transaction.id)")
            }
            
            Text(CurrencyFormatters.format(transaction.amount))
                .font(CustomFonts.amountValue)
                .accessibilityIdentifier("\(transaction.amount)-\(transaction.id)")
        }
        .padding(.vertical, 6)
    }
}

