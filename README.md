# FAIR Terminology Meets CLEAR Global

> **Research use only. Not a medical device.**
> This software was developed in the HEREDITARY project as a research prototype. It has not been assessed or certified under the EU Medical Device Regulation (EU) 2017/745. It must not be used to diagnose, treat, monitor or make any other decision about individual patients.

Research software accompanying **FAIR Terminology Meets CLEAR Global**, by Giorgio Maria Di Nunzio, Eszter Papp, Federica Vezzani and Ellie Kemp (TPDL 2024).

- [Paper](https://www.dei.unipd.it/~dinunzio/publications/di-nunzio-fair-terminology-meets-24/paper.pdf)
- [Published chapter](https://doi.org/10.1007/978-3-031-72440-4_17)
- [Research application cited in the paper](https://shiny.dei.unipd.it/CLEARGlobal_FAIR_psea)
- [Original CLEAR Global safeguarding and PSEA glossary](https://clearglobal.org/safeguarding-and-psea/)

The application provides a concept-oriented view of CLEAR Global's multilingual safeguarding and protection from sexual exploitation and abuse (PSEA) terminology. Select a source language and term to inspect its English concept definition, source-language equivalents and optional target-language equivalents. It retrieves existing glossary entries; it does not train a model, generate translations or process case reports.

## Run locally

Install R and the packages used by the supplied application:

```r
install.packages(c("shiny", "tidyverse", "DT"))
```

Clone or download this repository. From its root, run:

```r
shiny::runApp("source/CLEARGlobal_FAIR_psea")
```

The app expects both RDS files in its own `data/` directory. Keep the application folder and data together. [Usage and deployment instructions](docs/USAGE.md) explain the workflow and host configuration checks.

## Repository contents

| Path | Contents |
|---|---|
| `source/CLEARGlobal_FAIR_psea/` | Supplied R Shiny application and its data; original code and data bytes preserved |
| [source/source.md](source/source.md) | Entry points, dependencies and current implementation status |
| [corpus/corpus.md](corpus/corpus.md) | Dataset provenance, structure and measured snapshot counts |
| [docs/DATA_NOTES.md](docs/DATA_NOTES.md) | Differences between the workbook, app data and paper; rebuild caveats |
| [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) | Maintainer tasks, validation steps and known source limitations |
| [docs/VERIFICATION.md](docs/VERIFICATION.md) | Checks completed for this package and remaining verification |
| [MODEL_CARD.md](MODEL_CARD.md) | Intended use, data provenance, limitations and responsible-use guidance |
| [DATA_LICENSE.md](DATA_LICENSE.md) | Third-party data attribution and redistribution status |
| [CITATION.cff](CITATION.cff) | Citation metadata |

## Data snapshot

| Resource | Concepts | Languages | Term records |
|---|---:|---:|---:|
| Supplied app data (`reshaped_data.rds`) | 208 | 39 | 10,393 |
| Supplied source workbook | 208 | 39 | 10,396 |
| Dataset described in the 2024 paper | 208 | 39 | 9,506 |

These figures describe different supplied or published artifacts. They must not be treated as interchangeable versions or as performance measurements. The workbook and RDS files have been retained without regenerating them. Concept IDs and term IDs identify terminology entries, not people. No patient records, individual incident reports or user-study responses are included in the supplied dataset.

## Implemented features and limits

Source-language selection, term filtering, English definitions and optional target-language lookup are implemented. The supplied interface also contains a **Download TBX** button, but the accompanying server code has no handler for it. TBX export is described in the paper; it is **not implemented in this source snapshot**. The separately hosted application may differ.

The supplied preprocessing script uses fixed column positions, skips the final six-column language block and writes only one of the two RDS files needed by the app. It is retained as source history and is not a complete, verified rebuild pipeline. See [data notes](docs/DATA_NOTES.md) before running or replacing it.

## Responsible use

Use the glossary as a terminology reference and verify language variety, region, context and source currency with qualified language and safeguarding professionals. Do not use a term match to make an individual clinical, legal, safeguarding, eligibility or disciplinary decision. Do not enter names, identifiable case narratives or confidential incident details into table searches. The data include sensitive terminology about exploitation and abuse, but are not records of abuse incidents.

Application selections and DataTables searches are processed by the configured Shiny host. No application-level input logger, persistent user database or external API call was found in the supplied source. Infrastructure logs, retention and server location depend on the operator. UI changes, including the separate one-line disclaimer, are outside this packaging update.

## License and attribution

The existing [Apache-2.0 LICENSE](LICENSE) is retained for the original software. CLEAR Global glossary data and derivatives are third-party resources; their redistribution terms were not supplied and are not granted by the software license. **Before publishing the bundled data, confirm the applicable data license or redistribution permission with the data owner.** See [DATA_LICENSE.md](DATA_LICENSE.md).

This package combines the supplied application and repository skeleton with expanded documentation. It does not claim certification of FAIR compliance, validated TBX export, clinical effectiveness or accuracy across all languages.

## Citation

Di Nunzio, G.M., Papp, E., Vezzani, F., Kemp, E. (2024). *FAIR Terminology Meets CLEAR Global*. In: *Linking Theory and Practice of Digital Libraries*, LNCS 15178, pp. 173–182. https://doi.org/10.1007/978-3-031-72440-4_17

## Contact and acknowledgement

For software issues, misuse concerns or vulnerability reports: giorgiomaria.dinunzio@unipd.it. For glossary terminology and data conditions, refer to CLEAR Global's source resource and contact channels.

Partially funded by the European Union under grant agreement No 101137074 (HEREDITARY). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Health and Digital Executive Agency (HaDEA). Neither the European Union nor the granting authority can be held responsible for them.
