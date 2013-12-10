#!/bin/sh
version=`cat version`
rm bin/css/*.css
java -jar lib/yuicompressor.jar src/css/sydsvenskan.user.css -o bin/css/sydsvenskan.user.css
cp bin/css/sydsvenskan.user.css "bin/css/sydsvenskan-$version.user.css"
