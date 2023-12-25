# TinyVG Conversion Files for Powerline Glyphs

This repository contains TinyVG conversions for certain glyphs in the PowerLine
Extra range, commonly found in Nerd Fonts.

Currently, this repository serves as a PoC to fix some issues with the TinyVG
converter (svg2tvgt).

## Generating

There is a rudimentary script in `./tools/generate.sh` that will refresh the
TVG Text, TVG, and TGA files. However, this repository does not bundle the
actual tools and they need to be generated from the SDK.

To use the script, either place the tools in the locations expected in the
script in `tools/bin`, or edit the script to point to them.

## Floating point patch for exponential notation (`svg2tvgt`)

Note that a couple of the glyphs need to have `svg2tvgt` patched to accept
exponential notation in floating-point path values (see
[TinyVG/sdk#20](https://github.com/TinyVG/sdk/pull/20).
