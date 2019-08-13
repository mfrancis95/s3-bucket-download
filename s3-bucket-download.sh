for line in $(curl -Ls $1 | grep -oP 'y>[^<]+'); do
    echo "Downloading $1${line:2}..."
    curl -Ls $1${line:2} > ${line:2}
done
