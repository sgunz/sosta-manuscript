# Code repository – "Analysis of anatomical multi-cellular structures from spatial omics data using _sosta_"

This repository contains code to reproduce analyses of the _sosta_ preprint. `sosta` is available from [Bioconductor](https://bioconductor.org/packages/sosta/).

## Installing necessary R packages
R and Python packages are managed using `renv`. To install necessary R packages you can use `renv::restore()`. All Python requirements are stored in `requirments.txt`

## Data
All datasets used are publicly available. The CosMx TVA dataset is available at https://zenodo.org/records/15574384. The IMC pancreatic islets dataset is accessible through Bioconductor's `ExperimentHub` via the R package `imcdatasets` and alternatively at https://data.mendeley.com/datasets/cydmwsfztj/2. The Visium HD human tonsil data is available from the [10x Genomics Datasets resource](https://www.10xgenomics.com/datasets/visium-hd-cytassist-gene-expression-libraries-human-tonsil-ff-ultima).

# Session Info

```
R version 4.5.1 (2025-06-13)
Platform: aarch64-apple-darwin20
Running under: macOS Sequoia 15.7.4

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: Europe/Zurich
tzcode source: internal

attached base packages:
[1] stats4    stats     graphics  grDevices datasets  utils    
[7] methods   base     

other attached packages:
 [1] alphahull_2.5               terra_1.8-93               
 [3] purrr_1.2.1                 imcRtools_1.14.0           
 [5] reticulate_1.45.0           ggspavis_1.14.3            
 [7] spdep_1.4-2                 spData_2.3.4               
 [9] sf_1.0-24                   dplyr_1.2.0                
[11] tidyr_1.3.2                 ggplot2_4.0.2              
[13] sosta_1.3.2                 SpatialExperiment_1.18.1   
[15] SingleCellExperiment_1.30.1 SummarizedExperiment_1.38.1
[17] Biobase_2.68.0              GenomicRanges_1.60.0       
[19] GenomeInfoDb_1.44.3         IRanges_2.42.0             
[21] S4Vectors_0.46.0            BiocGenerics_0.54.1        
[23] generics_0.1.4              MatrixGenerics_1.20.0      
[25] matrixStats_1.5.0          

loaded via a namespace (and not attached):
  [1] later_1.4.6             bitops_1.0-9           
  [3] R.oo_1.27.1             tibble_3.3.1           
  [5] svgPanZoom_0.3.4        polyclip_1.10-7        
  [7] lifecycle_1.0.5         vroom_1.7.0            
  [9] lattice_0.22-9          MASS_7.3-65            
 [11] magrittr_2.0.4          yaml_2.3.12            
 [13] httpuv_1.6.16           otel_0.2.0             
 [15] ggside_0.4.1            sp_2.2-1               
 [17] spatstat.sparse_3.1-0   DBI_1.2.3              
 [19] RColorBrewer_1.1-3      abind_1.4-8            
 [21] R.utils_2.13.0          ggraph_2.2.2           
 [23] RCurl_1.98-1.17         tweenr_2.0.3           
 [25] GenomeInfoDbData_1.2.14 ggrepel_0.9.6          
 [27] RTriangle_1.6-0.15      spatstat.utils_3.2-1   
 [29] pheatmap_1.0.13         units_1.0-0            
 [31] goftest_1.2-3           spatstat.random_3.4-4  
 [33] svglite_2.2.2           codetools_0.2-20       
 [35] DelayedArray_0.34.1     scuttle_1.18.0         
 [37] DT_0.34.0               ggforce_0.5.0          
 [39] tidyselect_1.2.1        raster_3.6-32          
 [41] UCSC.utils_1.4.0        farver_2.1.2           
 [43] viridis_0.6.5           sgeostat_1.0-27        
 [45] spatstat.explore_3.7-0  jsonlite_2.0.0         
 [47] BiocNeighbors_2.3.1     e1071_1.7-17           
 [49] tidygraph_1.3.1         systemfonts_1.3.1      
 [51] smoothr_1.2.1           tools_4.5.1            
 [53] Rcpp_1.1.1              glue_1.8.0             
 [55] gridExtra_2.3           SparseArray_1.8.1      
 [57] xfun_0.56               EBImage_4.50.0         
 [59] HDF5Array_1.36.0        shinydashboard_0.7.3   
 [61] withr_3.0.2             BiocManager_1.30.27    
 [63] fastmap_1.2.0           boot_1.3-32            
 [65] rhdf5filters_1.20.0     digest_0.6.39          
 [67] R6_2.6.1                mime_0.13              
 [69] textshaping_1.0.4       colorspace_2.1-2       
 [71] wk_0.9.5                tensor_1.5.1           
 [73] jpeg_0.1-11             dichromat_2.0-0.1      
 [75] spatstat.data_3.1-9     R.methodsS3_1.8.2      
 [77] h5mread_1.0.1           utf8_1.2.6             
 [79] renv_1.1.7              data.table_1.18.2.1    
 [81] class_7.3-23            graphlayouts_1.2.2     
 [83] httr_1.4.8              htmlwidgets_1.6.4      
 [85] S4Arrays_1.8.1          pkgconfig_2.0.3        
 [87] gtable_0.3.6            S7_0.2.1               
 [89] XVector_0.48.0          htmltools_0.5.9        
 [91] fftwtools_0.9-11        scales_1.4.0           
 [93] png_0.1-8               spatstat.univar_3.1-6  
 [95] splancs_2.01-45         knitr_1.51             
 [97] rstudioapi_0.18.0       tzdb_0.5.0             
 [99] rjson_0.2.23            curl_7.0.0             
[101] nlme_3.1-168            proxy_0.4-29           
[103] cachem_1.1.0            rhdf5_2.52.1           
[105] stringr_1.6.0           KernSmooth_2.23-26     
[107] parallel_4.5.1          vipor_0.4.7            
[109] concaveman_1.2.0        s2_1.1.9               
[111] pillar_1.11.1           grid_4.5.1             
[113] vctrs_0.7.1             promises_1.5.0         
[115] beachmat_2.25.5         distances_0.1.13       
[117] xtable_1.8-4            beeswarm_0.4.0         
[119] evaluate_1.0.5          readr_2.1.6            
[121] magick_2.9.0            cli_3.6.5              
[123] locfit_1.5-9.12         compiler_4.5.1         
[125] rlang_1.1.7             crayon_1.5.3           
[127] interp_1.1-6            classInt_0.4-11        
[129] ggbeeswarm_0.7.3        stringi_1.8.7          
[131] viridisLite_0.4.3       deldir_2.0-4           
[133] BiocParallel_1.42.2     nnls_1.6               
[135] cytomapper_1.20.0       tiff_0.1-12            
[137] spatstat.geom_3.7-0     V8_8.0.1               
[139] Matrix_1.7-4            hms_1.1.4              
[141] patchwork_1.3.2         bit64_4.6.0-1          
[143] Rhdf5lib_1.30.0         shiny_1.12.1           
[145] igraph_2.2.2            memoise_2.0.1          
[147] bit_4.6.0   
```
