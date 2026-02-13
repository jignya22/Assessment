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

# Testing Status

✅ Unit tests: JSON decoding + repository fetch

⏳ UI tests: pending (to be added)

Notes: 

UI tests were not completed within the given timeframe. Planned UI test coverage:

Verify transactions list renders and is scrollable.

Tap a transaction row → detail screen appears.

Verify credit/debit header label and icon presence.

Verify tooltip default text.

Tap “Show more” → expanded text appears.

Tap “Show less” → expanded text collapses.

Tap “Close” → returns to list screen.
