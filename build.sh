#!/bin/bash

# change this to your local cpbo path, in case cpbo.exe is not in the current dir
cpbo_path="$1"
missionname="TvT_KoeniglicherKampf"

islands=(
	Altis
	Chernarus
	Esseker
	fata
	Kunduz
	namalsk
	Porto
	Sara_dbe1
	Stratis
	SugarLake
	Takistan
	utes
	Zargabad
)

### AS AS USER, DONT EDIT BELOW THIS LINE ###

if [[ ! -f $cpbo_path ]]; then
	cpbo_path="./cpbo.exe"
fi

if [[ ! -f $cpbo_path ]]; then
	echo "warning: cpbo path not found, will not build pbo files!"
	exit 1
fi


VERSION=$(git describe)

echo "Repository Version: $VERSION"

MAINVERSION=$(echo $VERSION | cut -d "-" -f1)
COMMITSBEHIND=$(echo $VERSION | cut -d "-" -f2)
SHORTHASH=$(echo $VERSION | cut -d "-" -f3)

MAJOR=$(echo $MAINVERSION | cut -d "." -f1)
MINOR=$(echo $MAINVERSION | cut -d "." -f2)
BUGFIX=$COMMITSBEHIND

VERSION="$MAJOR.$MINOR.$BUGFIX"

if test "$MAINVERSION" = "$COMMITSBEHIND"
then
	VERSION="$MAJOR.$MINOR"
fi

echo "Version-String: $VERSION"

cwd=`pwd`

builddir="$cwd/../tmp-build"

mkdir -p "$builddir"

tmpdir="$builddir/tmpdir"



cp -r ./ "$tmpdir"
rm "$tmpdir/build.sh"
rm "$tmpdir/cpbo.exe"
rm -fr "$tmpdir/.git"
rm "$tmpdir/.gitattributes"
rm "$tmpdir/.gitignore"

echo "building PBO...";
$cpbo_path -y -p "$tmpdir" > /dev/null
echo "done (probably)"

pbofilename="${tmpdir}.pbo"

if [[ ! -f "$pbofilename" ]]; then
	echo "örks"
	exit 2
fi

echo "copying pbo for different islands..."
for island in "${islands[@]}"; do
	cp "$pbofilename" "${builddir}/${missionname}_${VERSION}.${island}.pbo"
done

echo "done. clean up..."
rm -r "$tmpdir"
rm "$pbofilename"
echo "plz see $builddir for pbo files"
sleep 2
