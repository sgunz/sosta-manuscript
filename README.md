# Session Info

```
R version 4.5.1 (2025-06-13)
Platform: aarch64-apple-darwin20
Running under: macOS Sequoia 15.7.1

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: America/New_York
tzcode source: internal

attached base packages:
[1] parallel  stats4    stats     graphics  grDevices datasets  utils     methods   base     

other attached packages:
 [1] vegan_2.7-1                     permute_0.9-8                  
 [3] SpatialFeatureExperiment_1.10.1 patchwork_1.3.2                
 [5] ggrastr_1.0.2                   scater_1.36.0                  
 [7] scuttle_1.18.0                  BiocParallel_1.42.2            
 [9] mumosa_1.16.0                   ggspavis_1.14.3                
[11] spdep_1.4-1                     spData_2.3.4                   
[13] smoothr_1.1.0                   sf_1.0-21                      
[15] dplyr_1.1.4                     tidyr_1.3.1                    
[17] ggplot2_4.0.0                   sosta_1.1.1                    
[19] SpatialExperiment_1.18.1        SingleCellExperiment_1.30.1    
[21] SummarizedExperiment_1.38.1     Biobase_2.68.0                 
[23] GenomicRanges_1.60.0            GenomeInfoDb_1.44.3            
[25] IRanges_2.42.0                  S4Vectors_0.46.0               
[27] BiocGenerics_0.54.0             generics_0.1.4                 
[29] MatrixGenerics_1.20.0           matrixStats_1.5.0              

loaded via a namespace (and not attached):
  [1] spatialreg_1.4-2          spatstat.sparse_3.1-0     bitops_1.0-9             
  [4] EBImage_4.50.0            httr_1.4.7                RColorBrewer_1.1-3       
  [7] tools_4.5.1               R6_2.6.1                  ResidualMatrix_1.18.0    
 [10] HDF5Array_1.36.0          uwot_0.2.3                mgcv_1.9-3               
 [13] rhdf5filters_1.20.0       withr_3.0.2               sp_2.2-0                 
 [16] gridExtra_2.3             cli_3.6.5                 textshaping_1.0.3        
 [19] Cairo_1.6-5               spatstat.explore_3.5-3    sandwich_3.1-1           
 [22] labeling_0.4.3            mvtnorm_1.3-3             S7_0.2.0                 
 [25] spatstat.data_3.1-8       proxy_0.4-27              systemfonts_1.2.3        
 [28] R.utils_2.13.0            dichromat_2.0-0.1         maps_3.4.3               
 [31] limma_3.64.3              rstudioapi_0.17.1         RSQLite_2.4.3            
 [34] pals_1.10                 spatstat.random_3.4-2     scrapper_1.3.6           
 [37] Matrix_1.7-4              ggbeeswarm_0.7.2          abind_1.4-8              
 [40] R.methodsS3_1.8.2         terra_1.8-60              lifecycle_1.0.4          
 [43] multcomp_1.4-28           yaml_2.3.10               edgeR_4.6.3              
 [46] rhdf5_2.52.1              SparseArray_1.8.1         grid_4.5.1               
 [49] blob_1.2.4                dqrng_0.4.1               crayon_1.5.3             
 [52] lattice_0.22-7            beachmat_2.25.5           annotate_1.86.1          
 [55] KEGGREST_1.48.1           mapproj_1.2.12            magick_2.9.0             
 [58] zeallot_0.2.0             pillar_1.11.1             knitr_1.50               
 [61] metapod_1.16.0            rjson_0.2.23              boot_1.3-32              
 [64] codetools_0.2-20          wk_0.9.4                  glue_1.8.0               
 [67] spatstat.univar_3.1-4     data.table_1.17.8         vctrs_0.6.5              
 [70] png_0.1-8                 gtable_0.3.6              cachem_1.1.0             
 [73] xfun_0.53                 S4Arrays_1.8.1            DropletUtils_1.28.1      
 [76] ggside_0.4.0              coda_0.19-4.1             survival_3.8-3           
 [79] sfheaders_0.4.4           units_0.8-7               statmod_1.5.0            
 [82] bluster_1.18.0            TH.data_1.1-4             nlme_3.1-168             
 [85] bit64_4.6.0-1             irlba_2.3.5.1             vipor_0.4.7              
 [88] KernSmooth_2.23-26        colorspace_2.1-2          DBI_1.2.3                
 [91] tidyselect_1.2.1          bit_4.6.0                 compiler_4.5.1           
 [94] AUCell_1.30.1             graph_1.86.0              BiocNeighbors_2.3.1      
 [97] h5mread_1.0.1             DelayedArray_0.34.1       scales_1.4.0             
[100] classInt_0.4-11           tiff_0.1-12               digest_0.6.37            
[103] goftest_1.2-3             fftwtools_0.9-11          spatstat.utils_3.2-0     
[106] XVector_0.48.0            htmltools_0.5.8.1         pkgconfig_2.0.3          
[109] jpeg_0.1-11               sparseMatrixStats_1.20.0  fastmap_1.2.0            
[112] rlang_1.1.6               htmlwidgets_1.6.4         UCSC.utils_1.4.0         
[115] DelayedMatrixStats_1.30.0 farver_2.1.2              zoo_1.8-14               
[118] jsonlite_2.0.0            R.oo_1.27.1               BiocSingular_1.24.0      
[121] RCurl_1.98-1.17           magrittr_2.0.4            GenomeInfoDbData_1.2.14  
[124] s2_1.1.9                  Rhdf5lib_1.30.0           Rcpp_1.1.0               
[127] viridis_0.6.5             MASS_7.3-65               ggrepel_0.9.6            
[130] deldir_2.0-4              Biostrings_2.76.0         splines_4.5.1            
[133] tensor_1.5.1              locfit_1.5-9.12           igraph_2.1.4             
[136] spatstat.geom_3.6-0       ScaledMatrix_1.16.0       LearnBayes_2.15.1        
[139] XML_3.99-0.19             evaluate_1.0.5            scran_1.36.0             
[142] renv_1.1.5                BiocManager_1.30.26       batchelor_1.24.0         
[145] purrr_1.1.0               polyclip_1.10-7           rsvd_1.0.5               
[148] lwgeom_0.2-14             xtable_1.8-4              e1071_1.7-16             
[151] viridisLite_0.4.2         class_7.3-23              ragg_1.5.0               
[154] tibble_3.3.0              memoise_2.0.1             beeswarm_0.4.0           
[157] AnnotationDbi_1.70.0      cluster_2.1.8.1           GSEABase_1.70.1  
```
