@echo off
setlocal

pushd examples
pushd textures
jai -import_dir ../.. -x64 textures_image_processing.jai || exit /b
popd
popd