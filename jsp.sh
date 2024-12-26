#!/bin/bash
if ! grep -q "export LD_LIBRARY_PATH=/usr/local/lib64" ~/.bashrc; then
    if [[ -z "${LD_LIBRARY_PATH}" ]]; then
        echo "export LD_LIBRARY_PATH=/usr/local/lib64" >> ~/.bashrc
    else
        echo "export LD_LIBRARY_PATH=/usr/local/lib64:${LD_LIBRARY_PATH}" >> ~/.bashrc
    fi
    echo "La variable LD_LIBRARY_PATH a été ajoutée à .bashrc"
else
    echo "La variable LD_LIBRARY_PATH existe déjà dans .bashrc"
fi
