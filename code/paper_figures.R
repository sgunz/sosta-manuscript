
library("gganatogram")
library("dplyr")
library("viridis")
library("gridExtra")## install from Github
library("svglite")
library("patchwork")

sel <- hgFemale_key |>
    filter(type != "reproductive")

sel

hgFemale <- gganatogram(data=sel, fillOutline='#a6bddb',
                        organism='human', sex='female', fill="type") +
    theme_void() +
    coord_equal() +
    scale_fill_manual(values = pals::cols25())

hgFemale

ggsave("misc/body.svg")


## sosta splots
##
library("sosta")

data("sostaSPE")

cells <- cbind(spatialCoords(sostaSPE), colData(sostaSPE)) |>
    as.data.frame() |>
    dplyr::filter(imageName == "image1") |>
    ggplot(aes(x = x, y = y, color = cellType)) +
    geom_point(size = 0.5) +
    theme_void() +
    coord_equal() +
    scale_color_manual(values = c("navy", "gold", "red3"))


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




cellA <- cbind(spatialCoords(sostaSPE), colData(sostaSPE)) |>
    as.data.frame() |>
    dplyr::filter(imageName == "image1") |>
    dplyr::filter(cellType == "A") |>
    ggplot(aes(x = x, y = y, color = cellType)) +
    geom_point(size = 0.5) +
    theme_void() +
    coord_equal() +
    scale_color_manual(values = c("navy", "gold", "red3")) +
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
    geom_point(size = 0.5) +
    coord_equal() +
    scale_colour_gradient2() +
    geom_sf(
        data = allStructs[allStructs$imageName == "image1",],
        fill = NA,
        color = "black",
        inherit.aes = FALSE, # this is important
        linewidth = 0.5

    ) +
    theme_void()

shapeMetrics <- totalShapeMetrics(allStructs)
head(shapeMetrics)

area <- cbind(allStructs, t(shapeMetrics)) |>
    filter(imageName == "image1") |>
    ggplot() +
    geom_sf(aes(fill = Area)) +
    theme_void() +
    scale_fill_gradient(low = "lightblue", high = "darkblue")
area

ggsave("misc/cellA.pdf", plot = cellA, width = 3.5, height = 3.5)
ggsave("misc/cells.pdf", plot = cells, width = 3.5, height = 3.5)
ggsave("misc/dist.pdf", plot = dist, width = 3.5, height = 3.5)
ggsave("misc/area.pdf", plot = area, width = 3.5, height = 3.5)

cells + cellA + dist

