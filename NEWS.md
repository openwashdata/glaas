# glaas (development version)

- The data come from a new pull of the WHO source on 13 November 2026. WHO loaded the source table again between 20 and 23 July 2026. The dataset now has 259,546 rows (0.2.0: 259,313) and the same 121 variables, with the same names and types. The survey cycles (2013 to 2024), the 151 countries, territories and areas and the 333 indicators are the same. Changes against 0.2.0: 19 answers of the 2024 cycle have another value (Niger, Ethiopia, Saudi Arabia), WHO gave some dimension values other codes (for example `SURVEIL_A` became `SURVEIL`), about 5,400 rows have another flag, comment or colour code, and all record identifiers and load times are new.
- The pull is kept in the repository as a dated snapshot, `data-raw/2026-11-13-glaas-who-pull.csv.xz`. The processing script, now `data-raw/data_processing.R`, rebuilds the data from the snapshot without a connection and holds every step that shapes the data, including the column types.
- The dataset is a plain tibble. The import details that readr had attached to the object in 0.2.0 are gone.
- A check runs once a month and opens an issue when the WHO source has changed since the pull.
- The CSV and XLSX files of the data are attached to the release on GitHub and archived on Zenodo. They are too large for the repository. The README links them.
- Lars Schöbitz is the maintainer of the package. Adriana Clavijo Daza, Colin Walder and Nicolò Massari are authors.
- The package has a data dictionary with one description per variable (#10). Some descriptions rest on the WHO column names and wait for confirmation by WHO.
- The package metadata carry keywords and the place and period the data cover, the title is shorter, and the vignette is an article on the website.

# glaas 0.2.0

- The complete GLAAS table of the WHO data platform, with 259,313 rows and 121 variables.
- The source pull of this version (25 to 27 January 2026) was not kept. WHO has loaded the source table again since, so this version cannot be rebuilt from the source.
