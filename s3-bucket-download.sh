show_usage() {
    echo 'Usage: s3-bucket-download URL'
    exit $1
}

if [ $# -eq 0 ]; then
    show_usage 1
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_usage 0
else
    for line in $(curl -Ls $1 | grep -oP 'y>[^<]+'); do
        echo "Downloading $1${line:2}..."
        curl -Ls $1${line:2} > ${line:2}
    done
fi