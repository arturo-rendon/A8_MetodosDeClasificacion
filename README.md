# A8_MetodosDeClasificacion
METODOS DE CLASIFICACIÓN PROYECTO INTEGRADOR ETAPA 2 PATRONES DE COMPORTAMIENTO
# Segmentación de Clientes con K-Means en R
Proyecto Integrador – Etapa 2  
Patrones de comportamiento mediante análisis de datos

---

## 📌 Descripción del proyecto

Este proyecto aplica técnicas de *Machine Learning no supervisado* utilizando el algoritmo **K-Means** para segmentar clientes según sus características numéricas. El objetivo es identificar patrones de comportamiento que permitan a una empresa tomar mejores decisiones basadas en datos.

El análisis se realizó con el dataset **Mall_Customers.csv**, que contiene información de edad, ingreso anual y nivel de gasto de distintos clientes.

---

## 📁 Contenido del repositorio

- `Mall_Customers.csv` — Dataset utilizado para el análisis.
- `segmentacion_clientes.R` — Script principal con el código en R.
- `Clientes_segmentados_etiquetados.csv` — Resultado final con los clusters asignados.
- `README.md` — Documentación del proyecto.

---

## 🎯 Objetivo del proyecto

Identificar grupos de clientes con características similares utilizando:

- Edad  
- Ingreso anual  
- Nivel de gasto  

La segmentación permite comprender patrones de consumo y apoyar decisiones estratégicas dentro de una organización.

---

## 🧠 Metodología

### 1. Carga y preparación de datos
Se importó el dataset y se renombraron columnas para facilitar la lectura.

### 2. Selección de variables numéricas
Se utilizaron las variables:
- `Age`
- `Income`
- `Spending`

### 3. Escalamiento
Las variables fueron escaladas con `scale()` para evitar que una domine sobre las demás.

### 4. Selección del número de clusters
Se aplicó el **método del codo** (`fviz_nbclust`) para determinar el valor óptimo de *K*.  
El análisis indicó que **K =