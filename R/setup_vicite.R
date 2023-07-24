#' produce a SingleCellExperiment with totalVI quantifications of 10k PBMC data (excluding
#' 5k PBMC data) with cells held in common with the OSCA ch12 CITE-seq example
#' @importFrom scater sumCountsAcrossCells
#' @import scviR
#' @import basilisk
#' @import BiocHail
#' @import methods
#' @import S4Vectors
#' @import SingleCellExperiment
#' @examples
#' ss = setup_vicite()
#' ss
#' @export
setup_vicite = function() {
  fullvi = scviR::getTotalVI5k10kAdata()
  ch12sce = scviR::getCh12Sce(clear_cache=FALSE)
  #    2.3.1Acquire cell identities and batch labels
  
  totvi_cellids = rownames(fullvi$obs)
  totvi_batch = fullvi$obs$batch
  
  #    2.3.2Acquire quantifications and latent space positions
  
  totvi_latent = fullvi$obsm$get("X_totalVI")
  totvi_umap = fullvi$obsm$get("X_umap")
  totvi_denoised_rna = fullvi$layers$get("denoised_rna")
  totvi_denoised_protein = fullvi$obsm$get("denoised_protein")
  totvi_leiden = fullvi$obs$leiden_totalVI
  
  #    2.3.3Drop 5k data from all
  
  is5k = which(totvi_batch == "PBMC5k")
  totvi_cellids = totvi_cellids[-is5k]
  totvi_latent = totvi_latent[-is5k,]
  totvi_umap = totvi_umap[-is5k,]
  totvi_denoised_rna = totvi_denoised_rna[-is5k,]
  totvi_denoised_protein = totvi_denoised_protein[-is5k,]
  
  totvi_leiden = totvi_leiden[-is5k]
  
  #    2.3.4Label the rows of components
  
  rownames(totvi_latent) = totvi_cellids
  rownames(totvi_umap) = totvi_cellids
  rownames(totvi_denoised_rna) = totvi_cellids
  rownames(totvi_denoised_protein) = totvi_cellids
  names(totvi_leiden) = totvi_cellids
  
  #    2.3.5Find common cell ids
  
  #    In this section we reduce the cell collections to cells common to the chapter 12 and totalVI datasets.
  
  comm = intersect(totvi_cellids, ch12sce$Barcode)
  
  #    2.3.6Build the totalVI SingleCellExperiment
  # select and order
  totvi_latent = totvi_latent[comm,]
  totvi_umap = totvi_umap[comm,]
  totvi_denoised_rna = totvi_denoised_rna[comm,]
  totvi_denoised_protein = totvi_denoised_protein[comm,]
  totvi_leiden = totvi_leiden[comm]
  
  # organize the totalVI into SCE with altExp
  
  totsce = SingleCellExperiment(SimpleList(logcounts=t(totvi_denoised_rna))) # FALSE name
  rowData(totsce) = S4Vectors::DataFrame(fullvi$var)
  rownames(totsce) = rownames(fullvi$var)
  rowData(totsce)$Symbol = rownames(totsce)
  nn = SingleCellExperiment(SimpleList(logcounts=t(totvi_denoised_protein))) # FALSE name
  reducedDims(nn) = list(UMAP=totvi_umap)
  altExp(totsce) = nn
  altExpNames(totsce) = "denoised_protein"
  totsce$leiden = totvi_leiden
  altExp(totsce)$leiden = totvi_leiden
  altExp(totsce)$ch12.clusters = altExp(ch12sce[,comm])$label
  
  # add average ADT abundance to metadata, for adt_profiles
  
  tot.se.averaged <- scater::sumCountsAcrossCells(altExp(totsce), altExp(totsce)$leiden,
                                          exprs_values="logcounts", average=TRUE)
  rownames(tot.se.averaged) = gsub("_TotalSeqB", "", rownames(tot.se.averaged))
  metadata(totsce)$se.averaged = tot.se.averaged
  totsce
}
