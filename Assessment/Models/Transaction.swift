//
//  Transaction.swift
//  Assessment
//

import Foundation


struct TransactionResponse: Decodable {
    let transactions: [Transaction]
}

struct Transaction: Decodable, Identifiable, Equatable {
    let key: String
    let transactionType: TransactionType
    let merchantName: String
    let description: String?
    let amount: Amount
    let postedDate: Date
    let fromAccount: String
    let fromCardNumber: String

    var id: String { key }

    enum CodingKeys: String, CodingKey {
        case key
        case transactionType = "transaction_type"
        case merchantName = "merchant_name"
        case description
        case amount
        case postedDate = "posted_date"
        case fromAccount = "from_account"
        case fromCardNumber = "from_card_number"
    }
}

enum TransactionType: String, Decodable {
    case credit = "CREDIT"
    case debit = "DEBIT"
}

struct Amount: Decodable, Equatable {
    let value: Decimal
    let currency: String
}
