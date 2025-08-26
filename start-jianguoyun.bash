#!/bin/bash
set -x
set -e

rm -r $WEBKIT_EXEC_PATH_LINK || true
ln -s $WEBKIT_EXEC_PATH_TARGET $WEBKIT_EXEC_PATH_LINK

# 坚果云会自升级，所以主程序不能放在只读的/opt/apps目录
installDir="$HOME/.nutstore/dist"
if [ ! -d "$installDir" ]; then
    rm -rf ~/.nutstore/linglong_dist_tmp
    mkdir -p ~/.nutstore/linglong_dist_tmp
    cp -r $APP_DIR/jianguoyun/* ~/.nutstore/linglong_dist_tmp/
    mv ~/.nutstore/linglong_dist_tmp "$installDir"
fi

exec $installDir/bin/nutstore-pydaemon.py
