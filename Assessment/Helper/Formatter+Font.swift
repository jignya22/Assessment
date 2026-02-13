//
//  Formatter.swift
//  Assessment
//

import Foundation
import SwiftUI

enum DateFormatters {
    static let yyyyMMdd: DateFormatter = {
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(secondsFromGMT: 0)
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
}

enum CurrencyFormatters {
    static func format(_ amount: Amount) -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.currencyCode = amount.currency
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 0

        let number = NSDecimalNumber(decimal: amount.value)
        return nf.string(from: number) ?? "\(amount.currency) \(number)"
    }
}

enum CustomFonts {
    static let pageTitle = Font.system(size: 20, weight: .semibold)
    static let transactionTitle = Font.system(size: 25, weight: .regular)
    static let fieldLabel = Font.system(size: 16, weight: .regular)
    static let fieldValue = Font.system(size: 18, weight: .regular)
    static let amountValue = Font.system(size: 18, weight: .regular)
    static let tooltipText = Font.system(size: 17, weight: .regular)
    static let tooltipLink = Font.system(size: 16, weight: .semibold)
    static let closeButton = Font.system(size: 20, weight: .semibold)
}
