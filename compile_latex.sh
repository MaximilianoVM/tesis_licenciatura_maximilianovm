#!/bin/bash

# Ejecutar pdflatex hasta que no haya más referencias pendientes
max_iterations=5
for i in $(seq 1 $max_iterations); do
  pdflatex -interaction=nonstopmode Tesis
done

# Generar bibliografía
bibtex Tesis

# Generar glosarios
glosstex Tesis acronimos.gdf

# Generar índices
makeindex Tesis.gxs -o Tesis.glx -s glosstex.ist

# Compilar el documento nuevamente para reflejar todos los cambios
for i in $(seq 1 2); do
  pdflatex -interaction=nonstopmode Tesis
done
