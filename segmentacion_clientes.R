# ============================================================
#   PROYECTO INTEGRADOR ETAPA 2
#   SEGMENTACIÓN DE CLIENTES CON K-MEANS
# ============================================================

library(factoextra)
library(ggplot2)
library(dplyr)

# --- Cargar datos ---
setwd("C:/GIT/Proyecto_R")
clientes <- read.csv("Mall_Customers.csv")

# --- Renombrar columnas para mejor lectura ---
clientes <- clientes %>% 
  rename(
    Income   = Annual.Income..k..,
    Spending = Spending.Score..1.100.
  )

# --- Selección de variables numéricas ---
vars <- clientes[, c("Age", "Income", "Spending")]

# --- Escalamiento de variables ---
vars_scaled <- scale(vars)

# --- Método del codo para elegir K ---
fviz_nbclust(vars_scaled, kmeans, method = "wss") +
  ggtitle("Método del Codo para Selección de K") +
  theme_minimal()

# --- K-Means con K = 5 ---
set.seed(123)
k5 <- kmeans(vars_scaled, centers = 5, nstart = 25)

# --- Agregar número de cluster ---
clientes$Cluster <- k5$cluster

# --- Etiquetas interpretadas de clusters ---
cluster_labels <- c(
  "Jóvenes con alto gasto",
  "Adultos con alto ingreso y bajo gasto",
  "Ingreso y gasto medio",
  "Adultos mayores con gasto medio-alto",
  "Jóvenes con alto ingreso y gasto muy alto"
)

clientes$ClusterLabel <- factor(cluster_labels[k5$cluster])

# --- Exportar tabla final ---
write.csv(clientes, "Clientes_segmentados_etiquetados.csv", row.names = FALSE)

# --- Gráfica de clusters ---
fviz_cluster(
  k5, 
  data = vars_scaled,
  geom = "point",
  ellipse.type = "norm",
  palette = "jco",
  ggtheme = theme_minimal(),
  labelsize = 6
) +
  labs(
    title = "Segmentación de Clientes (K-Means, K = 5)",
    subtitle = "Clusters etiquetados según edad, ingreso y nivel de gasto",
    x = "Componente 1",
    y = "Componente 2"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )
