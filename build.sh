#!/bin/bash -xe

WORK=$PWD

rm $WORK/Yabe/bin/Release/*

cd $WORK
xbuild /p:Configuration=Release

cd $WORK/Yabe/bin/Release
ln -rs $WORK/Yabe/Resources/EmbeddedDll/CalendarView.dll
ln -rs $WORK/Yabe/Resources/EmbeddedDll/PacketDotNet.dll
ln -rs $WORK/Yabe/Resources/EmbeddedDll/SharpPcap.dll
ln -rs $WORK/Yabe/Resources/EmbeddedDll/ZedGraph.dll

mkbundle -v -o Yabe --simple Yabe.exe \
    --machine-config /etc/mono/4.5/machine.config \
    --config ./Yabe.exe.config \
    --deps \
    --static \
    --library /usr/lib/libmono-native.so \
    --library /usr/lib/libMonoPosixHelper.so \
    --library /usr/lib/libgdiplus.so \

cd $WORK
