# Application source

The complete supplied application is in `CLEARGlobal_FAIR_psea/`.

| File | Role |
|---|---|
| `global.R` | Loads `shiny`, `tidyverse`, `DT` and the two trusted local RDS files; builds selection lists |
| `ui.R` | Source-language, term and target-language controls; definition and source/target tables; TBX button placeholder |
| `server.R` | Session-specific filtering, concept lookup and read-only table rendering |
| `load_and_reshape.R` | Legacy spreadsheet-to-long-table preparation script; see rebuild limitations below |
| `data/reshaped_data.rds` | Runtime terminology table, 10,393 rows and eight columns |
| `data/concepts_definitions.rds` | Runtime concept/English-definition table, 208 rows and three columns |
| `data/CLEAR Global PSEA glossary app export.xlsx` | Supplied upstream workbook, 208 data rows and 687 columns |

Run from the repository root with `shiny::runApp("source/CLEARGlobal_FAIR_psea")`. Shiny executes the app with its application directory as the working directory, so relative `./data/` paths resolve there.

Runtime packages: `shiny`, `tidyverse`, `DT`. The legacy preparation script additionally uses `readxl` and `stringr`.

The application is a lookup interface over existing entries. There is no learned model, translation generation, incident-intake form, user file-upload interface or glossary-editing workflow. The TBX button has no server handler in the supplied source. No source code or data has been changed in this packaging update.

See [development notes](../docs/DEVELOPMENT.md) and [data notes](../docs/DATA_NOTES.md) for the checks needed before extending the application or rebuilding its data.
