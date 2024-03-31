Workflow to process T2T Data that is stored at https://hgdownload.soe.ucsc.edu/gbdb/hs1/.

Using SLURM scheduler to facilitate parallelization, we:
  Download T2T data from UCSC
  Perform initial data processing (i.e., process native UCSC file formats like .bw or .bb) using Kent Utilities at http://hgdownload.soe.ucsc.edu/admin/exe/ 
  Identify regions of interest (e.g., areas of SegDups; areas not ever found priorly in GAIB builds, and so forth).
  Extract and merge the other data types to build final analysis-ready files
  Finally, analyze the data
