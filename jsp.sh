#!/bin/bash

# Ajouter la variable d'environnement LD_LIBRARY_PATH à ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
source ~/.bashrc
