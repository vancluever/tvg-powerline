#!/usr/bin/env bash

set -xe

SVG2TVGT="./bin/svg2tvgt/svg2tvgt"
TVG_TEXT="./bin/tvg-text"
TVG_RENDER="./bin/tvg-render"
CONVERT="convert"

pushd "$(dirname "$0")"

rm -f ../*.png ../*.tga ../*.tvg ../*.tvgt
for FILE in ../*.svg; do
  ${SVG2TVGT} "${FILE}"
done

for FILE in ../*.tvgt; do
  ${TVG_TEXT} --output "$(dirname "$FILE")"/"$(basename "$FILE" .tvgt)".tvg "${FILE}"
done

for FILE in ../*.tvg; do
  ${TVG_RENDER} --height 200 "${FILE}"
done

for FILE in ../*.tga; do
  ${CONVERT} "${FILE}" "$(dirname "$FILE")"/"$(basename "$FILE" .tga)".png
done

popd
