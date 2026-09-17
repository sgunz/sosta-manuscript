library("ggplot2")
library("patchwork")
library("ComplexHeatmap")


# read fig lists
fg1 <- readRDS("misc/subplts/subplotspp.rds")
fg2 <- readRDS("misc/subplts/subplotspp2.rds")
fg3 <- readRDS("misc/subplts/subplotspp3.rds")

# define no legends and x lab ticks
no_leg <- theme(legend.position = "none")

no_x_lab <- theme(
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank())

# define panels
a <- (fg1[[2]] + no_leg) + labs(tag = "A")
b <- fg1[[3]] + labs(tag = "B")
c <- fg1[[1]] + labs(tag = "C")

d <- fg1[[4]] + theme_bw() + no_x_lab + labs(fill = "region") + labs(tag = "D")
e <- fg1[[5]] + theme_bw() + no_x_lab + labs(fill = "cell type") + labs(tag = "E")
f <- fg1[[6]] + theme_bw() + labs(tag = "F")


## override e
p <- fg1[[5]] + theme_bw() + no_x_lab + labs(fill = "cell type") + labs(tag = "E")

p@layers$geom_boxplot$geom_params$outlier_gp$size <- 1
p@layers$geom_boxplot$geom_params$outlier_gp$stroke <- 0

ee <- ggproto(NULL, p@guides$guides$fill) # copy the existing guide
ee$params$ncol <- 2 # change only ncol
ee$params$override.aes$size <- 2.5
e <- p + guides(fill = ee) + no_x_lab

# override d
p2 <- fg1[[4]] + theme_bw() + no_x_lab + labs(fill = "region")  + labs(tag = "D")

p2@layers$geom_boxplot$geom_params$outlier_gp$size <- 1
p2@layers$geom_boxplot$geom_params$outlier_gp$stroke <- 0

ee2 <- ggproto(NULL, p2@guides$guides$fill) # copy the existing guide
ee2$params$override.aes$size <- 2.5
d <- p2 + guides(fill = ee2) + no_x_lab


fs <- 6

# row 1
layout1 <- "
AAAABBCC
AAAABBCC
"

r1 <- a + b + c +
    plot_layout(design = layout1) &
    theme(
        legend.text = element_text(size = fs),
        legend.title = element_text(size = fs, face = "bold"), # bold "region" / "cell type"
        strip.text = element_text(size = fs),
        plot.tag = element_text(size = fs + 1, face = "bold"),
        legend.key.size = unit(3, "mm"), # smaller keys so the legend fits the row height,
        plot.tag.position = c(0, 1), # top-left corner of each panel,
        plot.margin = margin(0, 0, 0, 0),
        legend.margin = margin(0, 0, 0, 0),
        legend.box.spacing = unit(0, "pt") # no gap between map and legend
    )

# row 2
layout2 <- "
AABBCCDDD
AABBCCDDD
"

r2 <- d + e + f + guide_area() +
    plot_layout(design = layout2, guides = 'collect') & guides(colour = "none") &
    theme(
        text = element_text(size = fs),
        axis.text = element_text(size = fs), # theme_bw() sets this to 0.8 * base size
        axis.title = element_text(size = fs),
        legend.text = element_text(size = fs),
        legend.title = element_text(size = fs, face = "bold"), # bold "region" / "cell type"
        strip.text = element_text(size = fs),
        plot.tag = element_text(size = fs + 1, face = "bold"),
        legend.key.size = unit(3, "mm"), # smaller keys so the legend fits the row height,
        plot.tag.position = c(0, 1), # top-left corner of each panel
        plot.margin = margin(0, 0, 0, 0),
        legend.margin = margin(0, 0, 0, 0),
        legend.box.spacing = unit(0, "pt") # no gap between map and legend
    )


r2


# row 3
layout3 <- "
AABBCCDD
AABBCCDD
"

th_print <- theme(
    text = element_text(size = fs),
    axis.text = element_text(size = fs),
    axis.title = element_text(size = fs),
    legend.text = element_text(size = fs),
    legend.title = element_text(size = fs, face = "bold"),
    strip.text = element_text(size = fs),
    legend.key.size = unit(3, "mm")
)

th_leg <- theme(
    text = element_text(size = fs),
    legend.text = element_text(size = fs),
    legend.title = element_text(size = fs, face = "bold"),
    strip.text = element_text(size = fs),
    legend.key.size = unit(3, "mm")
)

th_tag <- theme(
    plot.tag = element_text(size = fs + 1, face = "bold"),
    plot.tag.position = c(0, 1)
)

g <- fg2[[1]] + theme_void() + labs(tag = "G") + th_leg
h <- fg2[[2]] + theme_bw() + no_leg + th_print + labs(tag = "H")
i <- fg2[[3]] + theme_void() + theme(legend.position = "none") + labs(tag = "I")
j <- ggplot() + theme_void() + labs(tag = "J")

r3 <- g + h + i + j +
    plot_layout(design = layout3) &
    th_tag

r3

# row 4
K <- fg3[[1]] + labs(tag = "K") + th_leg
L <- fg3[[2]] + labs(tag = "L") + th_leg
M <- fg3[[3]]

K@guides$guides$colour$params$override.aes$size <- 2.5

# row 3
layout4 <- "
AABBCC
AABBCC
"
M@row_names_param$gp <- grid::gpar(fontsize = fs)
M@column_names_param$gp <- grid::gpar(fontsize = fs)
M@row_title_param$gp <- grid::gpar(fontsize = fs)
M@column_title_param$gp <- grid::gpar(fontsize = fs)
M@matrix_legend_param$title_gp <- grid::gpar(fontsize = fs, fontface = "bold")
M@matrix_legend_param$labels_gp <- grid::gpar(fontsize = fs)

# gene labels from anno_mark() in the top annotation
M@top_annotation@anno_list[[1]]@fun@var_env$labels_gp <- grid::gpar(fontsize = fs)

m_grob <- grid::grid.grabExpr(
    draw(M, heatmap_legend_side = "right"),
    width = 7.5 / 3, height = 8.75 / 4,
)

m <- wrap_elements(full = m_grob) + th_print + labs(tag = "M")

r4 <- K + L + m +
    plot_layout(design = layout4) &
    th_tag
r4




## All plots
fig2 <- wrap_plots(r1, r2, r3, r4, ncol = 1)
ggsave("Fig2.pdf", fig2, width = 7.5, height = 8.75, units = "in")


w <- 7.5 # max PLOS width (in)
h <- 8.75 / 4 # 1/4 of max PLOS height (in)



