while read e; do
  export $e
  echo "exported ${e}"
done <env