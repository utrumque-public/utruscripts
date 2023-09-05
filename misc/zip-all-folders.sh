for dir in */
do
    dir=${dir%*/}
    echo "Compressing $dir..."
    date
    zip -r -v -du $dir.zip $dir
    echo ""
done
echo "Done!"
