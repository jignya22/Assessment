# Assessment

The project contains no external network calls; data is loaded from the bundled local JSON file transaction-list.json.

No secrets/credentials are included in the repository.

# How to Run

Open Assessment.xcodeproj in Xcode.

Select an iOS Simulator.

Run (⌘R).

# Requirements Covered

Transaction list screen (merchant + description + amount).

Tap transaction → detail screen (credit/debit indicator).

Tooltip expands/collapses with “Show more / Show less”.

Close button returns to list.

Data loaded locally from transaction-list.json (no API).

# Architecture

SwiftUI + MVVM

Repository pattern for data access

Swift 6 concurrency (async/await) for loading/parsing JSON off the main thread

ViewModels annotated with @MainActor for UI-safe state updates

#Testing Status

Added unit tests for core logic.

UI tests are partially implemented due to time constraints.

Implemented:
- testCloseReturnsToList: Opens the first transaction, taps Close, and verifies navigation returns to the Transactions list.

- Added accessibility identifiers consistently across views to improve test stability.
