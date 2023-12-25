#!/usr/bin/env bash

set -xe

SVG2TVGT="./bin/svg2tvgt/svg2tvgt"
TVG_TEXT="./bin/tvg-text"
TVG_RENDER="./bin/tvg-render"

pushd "$(dirname "$0")"

rm -f ../*.tga ../*.tvg ../*.tvgt
for FILE in ../*.svg; do
  ${SVG2TVGT} "${FILE}"
done

for FILE in ../*.tvgt; do
  ${TVG_TEXT} --output "$(dirname "$FILE")"/"$(basename "$FILE" .tvgt)".tvg "${FILE}"
done

for FILE in ../*.tvg; do
  ${TVG_RENDER} --anti-alias --height 200 "${FILE}"
done

popd
