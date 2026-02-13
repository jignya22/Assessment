//
//  TransactionService.swift
//  Assessment
//

import Foundation

protocol TransactionServicing {
    func fetchTransactions() async throws -> [Transaction]
}

enum DataError: Error {
    case fileNotFound
    case invalidData
}

struct TransactionService: TransactionServicing {
    func fetchTransactions() async throws -> [Transaction] {
        guard let url = Bundle.main.url(forResource: "transaction-list", withExtension: "json") else {
            throw DataError.fileNotFound
        }

        let data = try Data(contentsOf: url)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatters.yyyyMMdd)
        let response = try decoder.decode(TransactionResponse.self, from: data)
        return response.transactions
    }
}
