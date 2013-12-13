#!/bin/sh
version=`cat version`
rm bin/* -r
java -jar lib/yuicompressor.jar src/sydsvenskan.user.css -o bin/sydsvenskan.user.css
cp bin/sydsvenskan.user.css "bin/sydsvenskan-$version.user.css"
