#!/bin/bash
set -x
set -e
# webkit2gtk 在固定位置查找二进制文件，所以将应用附带的文件复制到指定位置
cp -r $WEBKIT_EXEC_PATH/* /usr/lib/x86_64-linux-gnu/webkit2gtk-4.0/

# 坚果云会自升级，所以主程序不能放在/opt目录
installDir="$HOME/.nutstore/dist"
if [ ! -d "$installDir" ]; then
    rm -rf ~/.nutstore/linglong_dist_tmp
    mkdir -p ~/.nutstore/linglong_dist_tmp
    cp -r $PREFIX/jianguoyun/* ~/.nutstore/linglong_dist_tmp/
    mv ~/.nutstore/linglong_dist_tmp "$installDir"
fi

exec $installDir/bin/nutstore-pydaemon.py
