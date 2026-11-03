# Usage and deployment

## Local launch

1. Install R and the required packages: `install.packages(c("shiny", "tidyverse", "DT"))`.
2. Open the repository root in R or RStudio.
3. Run `shiny::runApp("source/CLEARGlobal_FAIR_psea")`.

Alternatively, open the application directory itself and run `shiny::runApp()` there. Keep the two runtime RDS files in that directory's `data/` folder. RDS files should be loaded only from trusted sources; do not add an arbitrary upload-to-`readRDS()` pathway.

## Browse terminology

Choose a source language, then a term. The interface displays the English definition and source-language equivalents for the concept. Optionally choose a target language to display its equivalents. Use table search to filter the displayed glossary, and inspect the concept ID and region when interpreting matches.

The current source does not handle ambiguous multi-concept matches comprehensively. If a lexical form can designate several concepts, verify the returned concept identifiers and definitions. The tables are read-only. No term-editing, model training, text-generation or incident-report submission workflow is supplied.

The Download TBX control is a placeholder in the supplied code. It cannot be treated as a working export feature. The live deployment referenced in the paper may contain additional code; this package does not verify that deployment.

## Host configuration

Deploy the complete `CLEARGlobal_FAIR_psea` application folder, including its data, on an R Shiny-compatible host with the runtime packages installed. No hosting credentials, container or production configuration is supplied.

Before exposing the app publicly, confirm data redistribution permission, document the host location and access controls, and check proxy/application logs and their retention. Do not enter identifying case narratives into search controls. The application has no built-in authentication or personal-data intake form; host controls and logs are managed outside this source.

The app requires a connection to its Shiny host. Offline use, audio playback and mobile accessibility have not been established for this code snapshot. The original CLEAR Global glossary has its own functionality and release process.
