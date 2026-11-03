# Development and implementation status

## Preserve the source snapshot

The R files and original data were copied byte-for-byte from the supplied working-app archive. This package adds documentation and citation metadata. It does not claim to reproduce the separately hosted application's current code.

## Maintainer tasks

| Area | Supplied-source status | Next verification or change |
|---|---|---|
| TBX export | UI `actionButton("download_tbx", ...)` has no server observer/download handler | Obtain the deployed handler or implement and validate an exporter before advertising it. Test the declared TBX dialect against its schema; language labels need verified language-code mapping. |
| Data rebuilding | Fixed positions, final language block excluded, only one output RDS saved | Replace with header-driven processing and generation of both runtime tables; see `DATA_NOTES.md`. |
| Ambiguous terms | Concept filtering compares vectors using `==` | Verify multi-concept terms; use explicit set membership and display concept distinctions when implementing a fix. |
| Displayed HTML | DT tables use `escape = FALSE` | Keep data trusted and review any markup or switch to escaped rendering before admitting untrusted content. |
| Missing data | Runtime data loaded directly from relative paths | Add clear validation/error handling if the deployment is extended. |
| Privacy | Session-specific selections, no explicit input logger or user database in the app | Verify infrastructure logs and host access/retention independently. |

UI disclaimer work is deferred. Do not mark a disclaimer as displayed in the app merely because it appears in README or MODEL_CARD.

## Manual R smoke check

In an R environment with the dependencies installed, launch the application and verify source-language selection, term selection, English-definition lookup, target-language equivalents and table search. Test a term that maps to several concepts and a concept with a missing English definition. Confirm that no terminology is changed by browsing. The supplied TBX control has no implementation, so it is excluded from any passed-feature claim.

The packaging environment had no R interpreter. No R application runtime, browser interaction, package installation or production-deployment test was performed here.
