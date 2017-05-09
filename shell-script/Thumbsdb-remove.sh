if test $# -eq 1
then
	if test -d $1
	then
		find $1 -name “Thumbs.db” -print0 | xargs  rm -r
		echo “Se han eliminado $(find $1 -name “Thumbs-db” | wc -l) archivos Thumbs.db”
	else
		echo “El parametro no es un directorio valido”
	fi
else
	echo “Comando con un solo parametro”
fi
exit
