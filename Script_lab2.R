#Load the package
library(Rqc)
#Get the path to the file
folder <- system.file(package="ShortRead", "extdata/E-MTAB-1147")

# Feeds fastq.qz files in "folder" to quality check function
qcRes <- rqc(path = folder, pattern = ".fastq.gz", openBrowser=FALSE, outdir="outputs")

rqcCycleQualityBoxPlot(qcRes)

rqcCycleBaseCallsLinePlot(qcRes)

rqcReadFrequencyPlot(qcRes)

# Aggregating multiple fastqc reports into a data frame
library(fastqcr)
# Demo QC directory containing zipped FASTQC reports
qc.dir <- system.file("fastqc_results", package = "fastqcr")
qc <- qc_aggregate(qc.dir)
qc

# Inspecting QC problems


# See which modules failed in the most samples
qc_fails(qc, "module")
# Or, see which samples failed the most
qc_fails(qc, "sample")

# Building multi QC reports
qc_report(qc.dir, result.file = "outputs/multi-qc-report" )

# Building one-sample QC reports (+ interpretation)
qc.file <- system.file("fastqc_results", "S1_fastqc.zip", package = "fastqcr")