#!/bin/bash

/etc/init.d/apache2 restart|zenity --progress --pulsate --title="Atencao" --text="Reiniciando apache"
