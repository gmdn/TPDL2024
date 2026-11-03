# Glossary data provenance and schema

The terminology originates from CLEAR Global and partner organizations' safeguarding and protection from sexual exploitation and abuse (PSEA) glossary. Source context: https://clearglobal.org/safeguarding-and-psea/ . The supplied research snapshot contains lexical entries and concept definitions, not individual incident, survivor, patient or survey records.

Data files are stored in `source/CLEARGlobal_FAIR_psea/data/`. They are third-party data: see [data license status](../DATA_LICENSE.md) before publication or redistribution.

| Artifact | Observed structure |
|---|---|
| `CLEAR Global PSEA glossary app export.xlsx` | Sheet `Approved terminology`; 208 concept rows; 687 columns; 114 six-column language/synonym blocks representing 39 language labels; 10,396 nonempty term-ID records |
| `reshaped_data.rds` | 10,393 term rows, 208 concepts and 39 languages; eight columns |
| `concepts_definitions.rds` | 208 concept rows; `Concept ID`, `Dictionary`, `PL Definition` |

The workbook's embedded edit timestamps are 24 January 2024; this is file metadata, not a confirmed extraction or release date. Public author/editor attribution is present in workbook metadata. No contact addresses or private individual records were identified in the inspected glossary content.

## Runtime terminology table

| Column | Meaning |
|---|---|
| `Concept ID` | Identifier for a concept, not a person |
| `Language` | Human-readable source language label, as supplied; not an ISO language-code field |
| `Definition` | Language-specific definition, if available |
| `Term ID` | Identifier for a term entry, not a subject identifier |
| `Term` | Lexical form or equivalent |
| `Region` | Regional usage qualifier, when present |
| `Term type` | Term-form category, when present |
| `Head term` | Supplied indicator of preferred/head-term status |

The separate concept table holds English definitions in `PL Definition`; missing values must not be interpreted as validated empty definitions.

## Limits

Coverage varies by language and regional variety. Counts are not translation-accuracy measurements. The app's supplied data contain 10,393 entries; the 2024 paper reports 9,506 for its study snapshot. The glossary owner's current web resource may differ from both. Preserve source attribution and version information when reusing or updating entries.
