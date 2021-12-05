# About

This repository analyzes viral genomes from New York State using [Nextstrain](https://nextstrain.org/). This is a copy of the [WA state build](https://github.com/blab/ncov-wa-build) which is itself a copy of the [original Nextstrain ncov](https://github.com/nextstrain/ncov/).

# Usage
Clone this repository.
```
git clone https://github.com/blab/ncov-ny.git
cd ncov-ny/
```

Modify build definitions, as needed, in `ny_profile/ny/builds.yaml`.

Running:
```
snakemake --profile ny_profiles/ny/
```
