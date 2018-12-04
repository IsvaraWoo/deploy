#！/bin/sh
tarname="party"
oriname="$tarname.new"
keeplog=false

args=`getopt -o o:t:k --long origin:,target:,keeplog -n "./deploy.sh [-o|--origin=$oriname] [-t|--target=$tarname] [-k|--keeplog]" -- "$@"`

eval set -- "$args"

while [ $# -gt 0 ] ; do
    case "$1" in
    -o|--origin) oriname="$2"; shift 2 ;;
    -t|--target) tarname="$2"; shift 2 ;;
    -k|--keeplog) keeplog=true; shift ;;
    --) shift; break ;;
    esac
done

if [ -f "$oriname" ]; then 
#    echo "mv $oriname $tarname"
    mv "$oriname" "$tarname"
fi

if [ $keeplog != true ]; then
#    echo "rm -f *.log"
    rm -f *.log
fi

pid=`ps aux | grep $tarname | grep -v grep | awk '{print $2}'`
# echo "$pid"
kill $pid
nohup "./$tarname" > /dev/null 2>err.log &
