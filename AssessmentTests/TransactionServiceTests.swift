//
//  TransactionParsingTests.swift
//  TransactionParsingTests
//

import XCTest
@testable import Assessment

final class TransactionServiceTests: XCTestCase {
    
    @MainActor
    func testFetchTransactionsReturnsItems() async throws {
        let repo = TransactionService()
        let items = try await repo.fetchTransactions()
        XCTAssertFalse(items.isEmpty)
    }
}

