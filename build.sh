#!/bin/sh
version=`cat version`
rm bin/css/*.min.css
java -jar lib/yuicompressor.jar src/css/sydsvenskan.user.css -o bin/css/sydsvenskan.user.min.css
cp bin/css/sydsvenskan.user.min.css "bin/css/sydsvenskan-$version.user.min.css"
