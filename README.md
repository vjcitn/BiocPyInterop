# BiocPyInterop

This package is the basis of a workshop that will address use of python
software in Bioconductor.  We focus on use of basilisk in packages BiocHail and scviR.

### Description of workshop

Abstract: Multilingual data science strategies can increase efficiency of discovery by taking advantage of diverse data management and analysis strategies.  

In this workshop we will examine interplay between R, Python, and Apache Spark in genetic and single-cell applications.  CITE-seq studies simultaneously quantify surface protein and mRNA abundance in single cells.  We will use scviR to compare interpretations based on deep learning and sequential component-specific methods.  

The UK Biobank is the foundation of thousands of genome-wide association studies.  The Telomere-to-Telomere project produced the first gapless human reference genome.  Both of these resources will be explored using BiocHail.  Workshop attendees will acquire an understanding of Aaron Lun's [basilisk](https://bioconductor.org/packages/basilisk) package and its use in isolating specific collections of python modules, the anndata representations and scvi-tools analyses of CITE-seq data, and the hail.is approach to structuring and analyzing massive genetics data resources using Spark Resilient Distributed Data.  All programming will be carried out in R; quarto documents that mix R and python will also be illustrated.

### Pre-requisites

* Basic knowledge of R syntax
* Interest in single-cell genomics, human genetics, deep learning

It will be helpful to have an acquaintance with 

* [a chapter of the OSCA book](http://bioconductor.org/books/3.17/OSCA.advanced/integrating-with-protein-abundance.html)
* [an scviR vignette](https://bioconductor.org/packages/release/bioc/vignettes/scviR/inst/doc/citeseq_tut.html)
* [a BiocHail vignette](https://bioconductor.org/packages/release/bioc/vignettes/BiocHail/inst/doc/gwas_tut.html)
* [a look at BiocT2T](https://vjcitn.github.io/BiocT2T/) -- note that we will not work with the T2T 1KG extract in detail, as it involves a 40+ GB download, but the mechanics of working with it on your own will be explained

### Participation

This is a 90 minute workshop that will cover

- programming with basilisk to establish predictable python infrastructure and interoperation
- exploration of torch-based tooling for single-cell analysis of a CITE-seq experiment
- exploration of spark-based tooling for interaction with 1000 genomes genotypes (and, if time permits, UK Biobank phenotypes)

### _R_ / _Bioconductor_ packages used

- basilisk
- OSCA.advanced
- scviR
- BiocHail

### Time outline

| Activity               | Time |
|------------------------|------|
|Verify setup            | 5m  |
|Motivations/discussion  | 5m  |
|basilisk and basilisk.utils | 10m |
|  (concerns with bloat)  |  |
|OSCA advanced: CITE-seq | 15m  |
|break			| 10 m |
|scviR -- AnnData and tutorial VAE | 20m |
|Hail: exploring 1KG and UKBB | 20m |
|Review | 5m |

### Workshop goals and objectives

- Learning goals:
    - understand basic issues with connecting R/Bioconductor to Python software tools for genomics
    - relate aspects of the anndata class to aspects of SummarizedExperiment
    - compare findings in a stepwise analysis of PBMC data in Bioconductor to those obtained
with findings from fitting an autoencoder to the same data in scvi-tools
    - explore Hail's structures and methods for working with genotypes and phenotypes at scale



- Learning objectives:
    - Understand the user situation when basilisk manages python resources and usage
        - review functions in basilisk.utils
        - assess resource consumption (disk space used per version of basilisk/client package)
        - process management: check ?getBasiliskFork
    - Review an analysis of CITE-seq data on 6800 cells with Bioconductor in [OSCA advanced](http://bioconductor.org/books/3.17/OSCA.advanced/integrating-with-protein-abundance.html)
        - review [ADT-based clustering and interpretation](http://bioconductor.org/books/3.17/OSCA.advanced/integrating-with-protein-abundance.html#clustering-and-interpretation)
        - review [correlations between abundances of mRNA and surface proteins](http://bioconductor.org/books/3.17/OSCA.advanced/integrating-with-protein-abundance.html#finding-correlations-between-features)
        - Examine the totalVI-based quantifications for similar findings
            - use plotUMAP and adtProfiles
            - understand graduated relationships between surface protein and mRNA abundance
        - Assess the sensitivity of totalVI-based interpretations to details of autoencoder training
    - Use BiocHail and spark
        - examine an artificial GWAS with 1000 genomes genotypes and a fabricated phenotype
        - understand how to use telomere-to-telomere variant calls with Hail


<!--
An example for a 45-minute workshop:

| Activity                     | Time |
|------------------------------|------|
| Packages                     | 15m  |
| Package Development          | 15m  |
| Contributing to Bioconductor | 5m   |
| Best Practices               | 10m  |

### Workshop goals and objectives

List "big picture" student-centered workshop goals and learning
objectives. Learning goals and objectives are related, but not the
same thing. These goals and objectives will help some people to decide
whether to attend the conference for training purposes, so please make
these as precise and accurate as possible.

*Learning goals* are high-level descriptions of what
participants will learn and be able to do after the workshop is
over. *Learning objectives*, on the other hand, describe in very
specific and measurable terms specific skills or knowledge
attained. The [Bloom's Taxonomy](#bloom) may be a useful framework
for defining and describing your goals and objectives, although there
are others.

### Learning goals

Some examples:

* describe how to...
* identify methods for...
* understand the difference between...

### Learning objectives

* analyze xyz data to produce...
* create xyz plots
* evaluate xyz data for artifacts

## Workshop

Divide the workshop into sections (`## A Section`). Include
fully-evaluated _R_ code chunks. Develop exercises and solutions, and
anticipate that your audience will walk through the code with you, or
work on the code idependently -- do not be too ambitious in the
material that you present.

-->



