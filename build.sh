#!/bin/sh

# clean bin dir
rm -rf bin/*

cd src
# concatenate and minify
cat head.css sydsvenskan.css feet.css > cat.css
java -jar ../lib/yuicompressor.jar cat.css -o ../bin/sydsvenskan.min.css
rm cat.css
cd ..

cd bin
# read and save version
version=`cat ../version`
echo "Current version: v$version"
echo -n "    New version: v"
read version
echo "$version" > ../version
cat ../src/version.css sydsvenskan.min.css > "sydsvenskan-$version.min.css"
# replace version placeholders
sed 's/\$version/'"$version"'/g' "sydsvenskan-$version.min.css" > sydsvenskan.min.css
cp sydsvenskan.min.css "sydsvenskan-$version.min.css"
echo " . . . . . . . . Done!"