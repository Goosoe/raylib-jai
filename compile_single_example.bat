@echo off
setlocal

pushd examples
pushd textures
jai -import_dir ../.. -x64 textures_particles_blending.jai || exit /b
popd
popd