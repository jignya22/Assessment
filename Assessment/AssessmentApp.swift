//
//  AssessmentApp.swift
//  Assessment
//

import SwiftUI

@main
struct AssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            let service = TransactionService()
            TransactionListView(viewModel: TransactionListViewModel(service: service))
        }
    }
}
