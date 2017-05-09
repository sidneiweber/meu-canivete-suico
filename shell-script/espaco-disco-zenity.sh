#!/bin/bash
gdialog --title 'Espaço livre em disco' --msgbox 'Espaço livre em Gigabytes no sistema de arquivos = '`df -h / | tail -1 | awk '{print $4}'` 0 0
