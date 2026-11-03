# Snapshot differences and rebuild limits

This package preserves the supplied workbook and RDS files unchanged.

| Artifact | Concepts | Languages | Term records |
|---|---:|---:|---:|
| Runtime `reshaped_data.rds` | 208 | 39 | 10,393 |
| Supplied workbook, all six-column blocks | 208 | 39 | 10,396 |
| Paper's reported dataset | 208 | 39 | 9,506 |

The workbook contains three Bengali entries not present in the runtime table: term IDs `1778-67`, `1783-57` and `1926-52`. These occupy the final six-column block. The runtime table and workbook also have representation differences, including line endings and missing/empty values; they are retained as distinct supplied artifacts.

## Legacy preparation script

`source/CLEARGlobal_FAIR_psea/load_and_reshape.R` assumes the source workbook has 687 columns and fixed six-column groups. Its `while (col_end < 684)` condition excludes the last group. It assigns `concepts` but only saves `reshaped_data.rds`; it does not generate `concepts_definitions.rds`, which the application also requires.

Do not describe that script as a complete, reproducible rebuild of both shipped RDS files. Running it can overwrite the terminology table. Back up the originals before any preparation work.

For a future rebuild, iterate through all complete groups derived from the actual headers, preserve identifiers and multilingual text, validate row counts and uniqueness, and generate both runtime tables. Compare missing-value and newline handling explicitly. Record new data provenance and version metadata; changing coverage is a new data release, not a documentation-only update.

No dataset has been regenerated for this documentation package.
