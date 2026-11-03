# TPDL2024 CLEAR Global FAIR termbase

> **Research use only. Not a medical device.**
> This software was developed in the HEREDITARY project as a research prototype. It has not been assessed or certified under the EU Medical Device Regulation (EU) 2017/745. It must not be used to diagnose, treat, monitor or make any other decision about individual patients.

## 1. Overview

| Field | Value |
|---|---|
| Name | CLEAR Global FAIR termbase — TPDL2024 research application |
| Version | Supplied application snapshot packaged with documentation on 3 November 2026; formal software release tag/date to confirm |
| Type | R Shiny terminology lookup application and glossary data; no trained model |
| Owner partner and contact | University of Padua (UNIPD); Giorgio Maria Di Nunzio, giorgiomaria.dinunzio@unipd.it. Glossary content originates from CLEAR Global and partners. |
| License | Apache-2.0 for original software, per supplied LICENSE. Third-party glossary redistribution terms/permission require confirmation; see DATA_LICENSE.md. |
| Repository and paper | https://github.com/gmdn/TPDL2024 ; https://doi.org/10.1007/978-3-031-72440-4_17 |
| Release date | Software/data release dates to confirm; paper first online 25 September 2024 |
| Related task or deliverable | HEREDITARY WP3; misuse assessment contributes to D9.1 |
| How to cite | Di Nunzio, G.M., Papp, E., Vezzani, F., Kemp, E. (2024). *FAIR Terminology Meets CLEAR Global*. LNCS 15178, pp. 173–182. https://doi.org/10.1007/978-3-031-72440-4_17 |

## 2. Intended use

**Primary intended use.** Research and demonstration of concept-oriented multilingual terminology lookup for safeguarding and protection from sexual exploitation and abuse (PSEA), and language-resource management.

**Intended users.** Researchers, terminology specialists, translators/interpreters, developers and humanitarian language/safeguarding professionals who can assess context and source currency.

**Out-of-scope uses.** Individual clinical diagnosis or treatment; legal or safeguarding case determinations; eligibility, employment or disciplinary decisions; profiling or identification of individuals; incident-report intake; use as a substitute for qualified language/context review; entry of personal or confidential case narratives into search controls.

## 3. Data provenance

| Resource | Source | Type and observed scope | Approval or access conditions |
|---|---|---|---|
| CLEAR Global PSEA glossary workbook | CLEAR Global and partners; supplied XLSX export | Lexical resource: 208 concepts, 39 language labels, 10,396 term-ID records across 687 columns | Public source resource exists; license/redistribution terms for this export were not supplied and must be confirmed. |
| App terminology table (`reshaped_data.rds`) | Supplied local derivative of glossary | 10,393 term rows, 208 concepts, 39 languages; concept, language, definition, term ID, term, region, term type, head-term fields | Same third-party content conditions apply. Three workbook Bengali entries are absent from this runtime snapshot. |
| English concept table (`concepts_definitions.rds`) | Supplied local glossary derivative | 208 rows; Concept ID, Dictionary, PL Definition | Same content conditions apply. |

Concept/term identifiers refer to lexical entries, not people. No individual incident, survivor, patient or user-study records were identified in the supplied glossary. Ordinary author/editor metadata remain in source files. Upstream glossary development involved expert/community review and field testing as described in the paper; individual field-test records are not included in this release. Approval applicability and upstream use conditions remain the release owner's responsibility to confirm.

The paper reports 9,506 terms for its study snapshot. This does not describe the 10,393-row supplied app data or the 10,396-entry workbook. The source resource may continue to evolve.

**Input handling.** Language/term selections and DataTables search queries are processed on the configured Shiny host. Read-only corpus tables are loaded from trusted local RDS files; per-session filtered tables are held in reactive memory. No application input logger, persistent user database, user file upload, glossary edit workflow or explicit external API call was found. Infrastructure logs, host location, backups and retention must be verified separately.

## 4. Method

- **Algorithm or architecture.** R Shiny with tidyverse filtering and DT read-only tables. Source-language/term selection finds concept definitions and source/target equivalents; there is no generated translation.
- **Training setting.** Not applicable. No learned model, weights, training procedure or inference call is supplied.
- **Privacy techniques.** The release uses non-personal terminology content and read-only tables, not anonymized case records. No differential privacy, secure aggregation or formal privacy guarantee is claimed for queries or host infrastructure.

## 5. Performance and coverage

- **Coverage.** Runtime: 208 concepts, 39 languages, 10,393 term records. Workbook: 10,396 term records. Counts were checked from the supplied files; they are not translation-accuracy scores.
- **Evaluation.** No application user-study dataset, clinical evaluation or quantitative cross-language accuracy benchmark is included. Upstream glossary review is described by its authors; the present review does not independently validate every translation.
- **Export status.** The supplied UI has a Download TBX button with no server handler. TBX export is described in the paper but is not implemented in this code snapshot. No TBX conformance claim is made.

## 6. Known limitations and risks

- **Language and context.** Coverage, regional variation, concept definitions and source currency may affect interpretation. Terminology matching cannot establish the facts of a case or authorize an intervention.
- **Snapshot differences.** The workbook, runtime RDS files and paper have different record counts. Preserve version distinctions; see docs/DATA_NOTES.md.
- **Rebuilding.** The legacy preparation script omits the last six-column block and generates only the terminology RDS. It is not a complete verified rebuild pipeline for both app tables.
- **Failure modes.** Ambiguous terms may map to multiple concepts; current filters do not comprehensively handle that case. Missing definitions may limit interpretation. Tables use HTML rendering and require trusted, reviewed data updates.
- **Privacy and misuse.** Search strings can disclose sensitive context if users enter private case information. No such entry is required for glossary lookup. Use non-personal queries and verify host access/log retention.
- **Validation limits.** Source/data inspection and common credential-pattern checks on 3 November 2026 found no embedded credentials or private case datasets. R was unavailable in the packaging environment, so no app runtime/browser test was performed. The supplied source and data were preserved unchanged; the live deployment was not audited.
- **Model privacy tests.** Membership-inference and model-inversion testing are not applicable because no trained model is included.

## 7. Responsible use and reporting

- **Terms of use.** Preserve the software license and CLEAR Global attribution. Confirm third-party data redistribution permission before publishing the bundled glossary; the software license does not grant it.
- **Use and deployment.** Verify source context, language variety and regional qualifiers with qualified professionals. Do not use the resource for individual decisions. Document host location, access, logging and retention before public deployment; avoid personal/incident narratives in table search.
- **Integrity.** Review new terminology data before loading or displaying it. Preserve trusted-source and version information; do not advertise missing export functionality as implemented.
- **Contact.** Software misuse/vulnerability reports: giorgiomaria.dinunzio@unipd.it. Glossary feedback and content questions: CLEAR Global's official resource/contact channels.

## 8. Acknowledgement

Partially funded by the European Union under grant agreement No 101137074 (HEREDITARY). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Health and Digital Executive Agency (HaDEA). Neither the European Union nor the granting authority can be held responsible for them.
