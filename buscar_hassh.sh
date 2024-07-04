#!/bin/bash

# Verificar si se ha proporcionado un argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <archivo_hasshdb>"
    exit 1
fi

# Archivo de base de datos de HASSH pasado como argumento
HASSHDB_FILE="$1"

# Verificar si el archivo existe
if [ ! -f "$HASSHDB_FILE" ]; then
    echo "El archivo $HASSHDB_FILE no existe."
    exit 1
fi

# HASSH hardcodeados
HASSH_ARRAY=(
    "0e4584cb9f2dd077dbf8ba0df8112d8e" # HASSHC1
    "06046964c022c6407d15a27b12a6a4fb" # HASSHC2
    "ae8bd7dd09970555aa4c6ed22adbbf56" # HASSHC3
    "78c05d999799066a2b4554ce7b1585a6" # HASSHC4
    "a984ff804585fabe3cd08f4b3849024a" # HASSHS S1
    "d6860cb7b1e2c756c6d687821aa58065" # test
)

# Iterar sobre cada HASSH y buscar en el archivo
for HASSH in "${HASSH_ARRAY[@]}"
do
    echo "Buscando HASSH: $HASSH"
    grep "$HASSH" "$HASSHDB_FILE"

    # Verificar si grep encontró una coincidencia
    if [ "$?" -ne 0 ]; then
        echo "HASSH $HASSH no encontrado en el archivo $HASSHDB_FILE."
    else
        echo "HASSH $HASSH encontrado."
    fi

    echo ""
done
