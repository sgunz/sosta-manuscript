library("dplyr")
library("viridis")
library("gridExtra")## install from Github
library("svglite")
library("patchwork")
library("ggrastr")
library("ggplot2")
library("SpatialExperiment")
library()

## sosta splots
##
library("sosta")

data("sostaSPE")

cells <- cbind(spatialCoords(sostaSPE), colData(sostaSPE)) |>
    as.data.frame() |>
    dplyr::filter(imageName == "image1") |>
    ggplot(aes(x = x, y = y, color = cellType)) +
    geom_point(size = 0.75) +
    theme_void() +
    coord_equal() +
    scale_color_manual(values = c("navy", "gold", "red3")) +
    guides(color="none")


(struct <- reconstructShapeDensityImage(
    sostaSPE,
    marks = "cellType",
    imageCol = "imageName",
    imageId = "image1",
    markSelect = "A",
    bndw = 4,
    dim = 500,
    thres = 0.05
))



im <- shapeIntensityImage( sostaSPE,
                     marks = "cellType",
                     imageCol = "imageName",
                     imageId = "image1",
                     markSelect = "A",
                     dim = 500)

ppp <- SPE2ppp(sostaSPE,
               marks = "cellType", imageCol = "imageName",
               imageId = "image1"
)
res <- .intensityImage(ppp, markSelect = "A", dim = 500)
im_dd <- as.data.frame(res$denIm)
thres <- findIntensityThreshold(ppp, markSelect = "A", res$bndw,
                                dim = 500)
im_df <- ggplot(im_dd, aes(
    x = .data$x,
    y = .data$y,
    color = .data$value
)) +
    geom_tile() +
    coord_equal() +
    labs(color = "intensity") +
    scale_color_viridis_c(option = "C") + theme_classic()

im_df <- rasterize(im_df, dpi = 300)

den_hist <- ggplot(
    filter(im_dd, .data$value > max(.data$value) / 250), aes(x = abs(.data$value))) +
    geom_histogram(bins = 50) +
    labs(x = "pixel intensity") +
    theme_light() +
    geom_vline(xintercept = thres, color = "seagreen") +
    theme_classic()
den_hist


cellA_cells <- cbind(spatialCoords(sostaSPE), colData(sostaSPE)) |>
    as.data.frame() |>
    dplyr::filter(imageName == "image1") |>
    dplyr::filter(cellType == "A") |>
    ggplot(aes(x = x, y = y, color = cellType)) +
    geom_point(size = 0.75) +
    theme_void() +
    coord_equal() +
    scale_color_manual(values = c("navy", "gold", "red3")) +
    guides(color="none")

cellA_outs <- cbind(spatialCoords(sostaSPE), colData(sostaSPE)) |>
    as.data.frame() |>
    dplyr::filter(imageName == "image1") |>
    dplyr::filter(cellType == "A") |>
    ggplot(aes(x = x, y = y, color = cellType)) +
   #geom_point(size = 0.75) +
    theme_void() +
    coord_equal() +
    scale_color_manual(values = c("navy", "gold", "red3")) +
    guides(color="none") +
    geom_sf(
        data = struct,
        fill = NA,
        color = "black",
        inherit.aes = FALSE, # this is important
        linewidth = 0.5
    )


cellA <- cbind(spatialCoords(sostaSPE), colData(sostaSPE)) |>
    as.data.frame() |>
    dplyr::filter(imageName == "image1") |>
    dplyr::filter(cellType == "A") |>
    ggplot(aes(x = x, y = y, color = cellType)) +
    geom_point(size = 0.75) +
    theme_void() +
    coord_equal() +
    scale_color_manual(values = c("navy", "gold", "red3")) +
    guides(color="none") +
    geom_sf(
        data = struct,
        fill = NA,
        color = "black",
        inherit.aes = FALSE, # this is important
        linewidth = 0.5
    )




allStructs <- reconstructShapeDensitySPE(
    sostaSPE,
    marks = "cellType",
    imageCol = "imageName",
    markSelect = "A",
    bndw = 4,
    thres = 0.05,
    nCores = 1
)

# Define colnames by numbering the cells
colnames(sostaSPE) <- paste0("cell_", c(1:dim(sostaSPE)[2]))

assign <- assingCellsToStructures(sostaSPE, allStructs,
                                  imageCol = "imageName", nCores = 1
)
# Assign using the correct order of the columns in the spe object
sostaSPE$structAssign <- assign[colnames(sostaSPE)]


sostaSPE$minDist <- minBoundaryDistances(
    spe = sostaSPE, imageCol = "imageName",
    structColumn = "structAssign", allStructs = allStructs
)

dist <- cbind(colData(sostaSPE), spatialCoords(sostaSPE)) |>
    as.data.frame() |>
    filter(imageName == "image1") |>
    ggplot(aes(x = x, y = y, color = minDist)) +
    geom_point(size = 0.75) +
    coord_equal() +
    scale_color_gradient2(low = "blue", mid = "gray99", high = "red",
                          name = "border\ndist.") +
    geom_sf(
        data = allStructs[allStructs$imageName == "image1",],
        fill = NA,
        color = "black",
        inherit.aes = FALSE, # this is important
        linewidth = 0.5

    ) +
    theme_void() +
    guides(color = guide_colourbar(theme = theme(
        legend.text = element_blank()
    )))

dist

shapeMetrics <- totalShapeMetrics(allStructs)
head(shapeMetrics)

area <- cbind(allStructs, t(shapeMetrics)) |>
    filter(imageName == "image1") |>
    ggplot() +
    geom_sf(aes(fill = Area)) +
    theme_void() +
    scale_fill_gradientn(colours = pals::parula(10)) +
    guides(fill = guide_colourbar(theme = theme(
        legend.text = element_blank()
    )))
area

ggsave("misc/cellA.pdf", plot = cellA, width = 3, height = 3)
ggsave("misc/cellA_cells.pdf", plot = cellA_cells, width = 3, height = 3)
ggsave("misc/cellA_outs.pdf", plot = cellA_outs, width = 3, height = 3)

ggsave("misc/cells.pdf", plot = cells, width = 3, height = 3)
ggsave("misc/dist.pdf", plot = dist, width = 3, height = 3)
ggsave("misc/area.pdf", plot = area, width = 3, height = 3)
ggsave("misc/denim.pdf", plot = im_df, width = 3, height = 2.5)
ggsave("misc/denhist.pdf", plot = den_hist, width = 2.75, height = 2.75)


 cells + cellA + dist

