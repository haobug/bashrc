MINGW_BASE=`ls -d /d/Qt/Tools/mingw* 2>/dev/null|sort|tail -n1` && \
i686_mingw=$MINGW_BASE/i686-w64-mingw32  && \
MINGW_QT=`ls -d /d/Qt/*.*/* 2>/dev/null|sort|tail -n1` && \
export PATH=$MINGW_QT/bin:$i686_mingw/bin:$MINGW_BASE/bin:$PATH
