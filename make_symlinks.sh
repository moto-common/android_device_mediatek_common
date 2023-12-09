cat $1/proprietary-files.txt | grep -E '/'$2'/' | sed 's;'$2'/;;g' | sed 's;vendor/;;g' | sort | uniq
