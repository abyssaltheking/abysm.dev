#!/bin/bash
# yoinked build_web.sh from https://github.com/karl-zylinski/odin-raylib-web/tree/main 
# just dont need all the other things, so i just copied over the script and made modifications
source "/usr/lib/emsdk/emsdk_env.sh"

# Point this to where you installed emscripten. Optional on systems that already
# have `emcc` in the path.
EMSCRIPTEN_SDK_DIR="/usr/lib/emsdk"
OUT_DIR="engine-build"

mkdir -p $OUT_DIR

export EMSDK_QUIET=1
[[ -f "$EMSCRIPTEN_SDK_DIR/emsdk_env.sh" ]] && . "$EMSCRIPTEN_SDK_DIR/emsdk_env.sh"

# Note RAYLIB_WASM_LIB=env.o -- env.o is an internal WASM object file. You can
# see how RAYLIB_WASM_LIB is used inside <odin>/vendor/raylib/raylib.odin.
#
# The emcc call will be fed the actual raylib library file. That stuff will end
# up in env.o
#
# Note that there is a rayGUI equivalent: -define:RAYGUI_WASM_LIB=env.o
odin build . -target:js_wasm32 -build-mode:obj -define:RAYLIB_WASM_LIB=env.o -define:RAYGUI_WASM_LIB=env.o -out:$OUT_DIR/game.wasm.o

ODIN_PATH=$(odin root)

cp $ODIN_PATH/core/sys/wasm/js/odin.js $OUT_DIR
cp ./template/websocketHandler.js $OUT_DIR

files="$OUT_DIR/game.wasm.o ${ODIN_PATH}/vendor/raylib/wasm/libraylib.a ${ODIN_PATH}/vendor/raylib/wasm/libraygui.a"

# index_template.html contains the javascript code that calls the procedures in
# source/main_web/main_web.odin
flags="-sUSE_GLFW=3 -sWASM_BIGINT -sASYNCIFY -sWARN_ON_UNDEFINED_SYMBOLS=0 -sASSERTIONS --shell-file ./template/index_template.html"

# For debugging: Add `-g` to `emcc` (gives better error callstack in chrome)
emcc -o $OUT_DIR/index.html $files $flags

rm $OUT_DIR/game.wasm.o

echo "Web build created in ${OUT_DIR}"
echo "You may need to run \"sudo chown -R \$USER:\$USER $OUT_DIR\" to be able to do anything with the folder"