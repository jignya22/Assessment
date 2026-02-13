//
//  TransactionViewModel.swift
//  Assessment
//

import Foundation
import SwiftUI
import Combine

final class TransactionListViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: TransactionService

    init(service: TransactionService) {
        self.service = service
    }

    func loadTransactions() async {
        isLoading = true
        errorMessage = nil
        do {
            let items = try await service.fetchTransactions()
            transactions = items.sorted { $0.postedDate > $1.postedDate }
        } catch {
            errorMessage = "Failed to load transactions."
        }
        isLoading = false
    }
}
