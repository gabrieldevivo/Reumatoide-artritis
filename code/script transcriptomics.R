




setwd("C:/Users/gabri/Downloads/Data_RA_raw/Data_RA_raw")

buildindex(
  basename = 'ref_human',
  reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',
  memory = 8000,
  indexSplit = TRUE)
align.patient1 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fasta", readfile2 = "SRR4785980_2_subset40k.fasta", output_file = "patient1.BAM")
align.patient1 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fasta.gz", readfile2 = "SRR4785980_2_subset40k.fasta.gz", output_file = "patient1.BAM")
align.patient1 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fna", readfile2 = "SRR4785980_2_subset40k.fna", output_file = "patient1.BAM")
align.patient1 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "patient1.BAM")
align.patient1 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "patient1.BAM")
align.patient2 <- align(index = "ref_human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "patient2.BAM")
align.patient3 <- align(index = "ref_human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq", output_file = "patient3.BAM")
align.patient4 <- align(index = "ref_human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "patient4.BAM")
align.cont1 <- align(index = "ref_human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "cont1.BAM")
align.cont2 <- align(index = "ref_human", readfile1 = "SRR4785820_1_subset40K.fastq", readfile2 = "SRR4785820_2_subset40K.fastq", output_file = "cont2.BAM")
align.cont3 <- align(index = "ref_human", readfile1 = "SRR4785828_1_subset40K.fastq", readfile2 = "SRR4785828_2_subset40K.fastq", output_file = "cont3.BAM")
align.cont4 <- align(index = "ref_human", readfile1 = "SRR4785831_1_subset40K.fastq", readfile2 = "SRR4785831_2_subset40K.fastq", output_file = "cont4.BAM")
library(Rsamtools)
samples <- c('patient1', 'patient2', 'patient3', 'patient4', 'cont1', 'cont2','cont3', 'cont4')
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})



library(readr)
library(dplyr)
library(Rsamtools)
library(Rsubread)


      
setwd("C:/Users/gabri/Downloads/Data_RA_raw/Data_RA_raw")
allsamples <- c("patient1.BAM", "patient2.BAM", "patient3.BAM", "patient4.BAM", "cont1.BAM", "cont2.BAM", "cont3.BAM", "cont4.BAM")
count_matrix <- featureCounts(
    files = allsamples,
    annot.ext = "genomic.gtf",
    isPairedEnd = TRUE,
    isGTFAnnotationFile = TRUE,
    GTF.attrType = "gene_id",
    useMetaFeatures = TRUE)

head(count_matrix$counts)
counts <- count_matrix$counts

colnames(counts) <- c("patient1", "patient2", "patient3", "patient4", "cont1", "cont2", "cont3", "cont4")
write.csv(counts, "gabrielmatrixdata.csv")
install.packages("KEGGREST")
install.packages"Rtools"
BiocManager::install('DESeq2')
library(DESeq2)
library(KEGGREST)

counts <- read.table("count_matrix.txt")
treatment <- c("patient", "patient", "patient", "patient", "control", "control", "control", "control")
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c("patient1", "patient2", "patient3", "patient4", "cont1", "cont2", "cont3", "cont4")

dds <- DESeqDataSetFromMatrix(countData = round(counts),
                                    colData = treatment_table,
                                    design = ~ treatment)
counts <- read.table("count_matrix.txt")
treatment <- c("patient", "patient", "patient", "patient", "control", "control", "control", "control")
treatment_table <- data.frame(treatment)

treatment <- c("control", "control", "control", "control", "patient", "patient", "patient", "patient")

treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c("SRR4785819", "SRR4785820", "SRR4785828", "SRR4785831", "SRR4785979", "SRR4785980", "SRR4785986", "SRR4785988")
dds <- DESeqDataSetFromMatrix(countData = round(counts),
                                    colData = treatment_table,
                                    design = ~ treatment)
View(dds)

resultaten <- results(dds)

write.table(resultaten, file = 'ResultatenCASUSWC3.csv', row.names = TRUE, col.names = TRUE)

sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)

sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]

laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]

laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]
if (!requireNamespace("EnhancedVolcano", quietly = TRUE)) {
 BiocManager::install("EnhancedVolcano")

library(EnhancedVolcano)
EnhancedVolcano(resultaten,
          lab = rownames(resultaten),
          x = 'log2FoldChange',
          y = 'padj')
EnhancedVolcano(resultaten,
        lab = rownames(resultaten),
        x = 'log2FoldChange',
        y = 'padj',
        pCutoff = 0)
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
library(BiocManager)

BiocManager::install("TxDb.Hsapiens.UCSC.hg38.knownGene")
BiocManager::install("goseq")
BiocManager::install("GO.db")
BiocManager::install("org.Hs.eg.db")
library(goseq)
library(org.Hs.eg.db)
library(GO.db)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)

resultaten <- read.table("ResultatenCASUSWC3.csv", header = TRUE, row.names = 1)

entrez_ids <- mapIds(
  org.Hs.eg.db,
  keys = rownames(resultaten),
  column = "ENTREZID",
  keytype = "SYMBOL",
  multiVals = "first"
)

resultaten$ENTREZID <- entrez_ids
resultaten <- na.omit(resultaten)

de_genen <- as.integer(resultaten$padj < 0.05 & !is.na(resultaten$padj))
names(de_genen) <- resultaten$ENTREZID
de_genen <- na.omit(de_genen)

txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
gene_lengths <- transcriptLengths(
  txdb,
  with.cds_len = TRUE,
  with.utr5_len = TRUE,
  with.utr3_len = TRUE
)

gene_lengths$tot_length <- gene_lengths$cds_len + gene_lengths$utr5_len + gene_lengths$utr3_len

length_vector <- tapply(gene_lengths$tot_length, gene_lengths$gene_id, mean)

common_ids <- intersect(names(de_genen), names(length_vector))
de_genen <- de_genen[common_ids]
bias_vector <- length_vector[common_ids]

pwf <- nullp(de_genen, bias.data = bias_vector)


gene2go <- AnnotationDbi::select(
  org.Hs.eg.db,
  keys = keys(org.Hs.eg.db, keytype = "ENTREZID"),
  columns = c("ENTREZID", "GO"),
  keytype = "ENTREZID"
)
gene2go <- na.omit(gene2go)
gene2cat <- split(gene2go$GO, gene2go$ENTREZID)

GO.wall <- goseq(pwf, gene2cat = gene2cat, use_genes_without_cat = TRUE)

GO.sig <- GO.wall[GO.wall$over_represented_pvalue < 0.05, ]

GO.sig$term <- Term(GO.sig$category)

write.csv(GO.sig, "GO_enrichment_significant.csv", row.names = FALSE)

head(GO.sig[, c("term", "over_represented_pvalue", "numDEInCat", "numInCat")])

library(ggplot2)
GO.sig.sorted <- GO.sig[order(GO.sig$over_represented_pvalue), ]

top_terms <- head(GO.sig.sorted, 10)

top_terms$term <- factor(top_terms$term, levels = rev(top_terms$term))

ggplot(top_terms, aes(x = term, y = -log10(over_represented_pvalue))) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(
    title = "De 10 beste verrijkte GO-termen",
    x = "GO-term",
    y = "-log10(p-waarde)"
  ) +
  theme_minimal(base_size = 12)
