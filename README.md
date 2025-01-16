# raylib-jai bindings

[Raylib](https://www.raylib.com/) is a minimal gamedev library for C and this repository has a script for automatically generating Jai bindings from `raylib.h`, `raymath.h` and `rlgl.h`.

> Tested with Jai version: beta 0.2.008

> Raylib version: 5.5
 
There are also examples--direct Jai ports of the [raylib examples](https://www.raylib.com/examples.html).

<a href="examples/core_3d_camera_first_person.jai"><img src="doc/screenshots/core_3d_camera_first_person.png" style="max-width: 398px;"></a>
<a href="examples/shaders_custom_uniform.jai"><img src="doc/screenshots/shaders_custom_uniform.png" style="max-width: 398px;"></a>
<a href="examples/shaders_texture_waves.jai"><img src="doc/screenshots/shaders_texture_waves.png" style="max-width: 398px;"></a>
<a href="examples/textures_bunnymark.jai"><img src="doc/screenshots/textures_bunnymark.png" style="max-width: 398px;"></a>

There are more than shown here ported in the [examples/](examples) folder.

## Minimal example

```
#load "path/to/raylib.jai";

main :: () {
    InitWindow(800, 450, "raylib example");
    defer CloseWindow();
    while !WindowShouldClose() {
        BeginDrawing();
        defer EndDrawing();
        ClearBackground(RAYWHITE);
        DrawText("raylib + jai", 190, 200, 20, LIGHTGRAY);
    }
}
```


## Building the examples

Run `compile_examples.bat` with `jai` on your PATH.

Run the example `.exe` files from the `examples/` directory.

## Differences from C raylib

* Some functions which take enum arguments (like `SetConfigFlags` for example) have their argument types changed from C's `int` (or Jai's `s32`) to the actual enum type. Consequently, you can call them like `SetConfigFlags(.FLAG_FULLSCREEN_MODE);`
* An additional set of macros lets you change any of the Begin/End function call pairs (like `BeginMode3D(camera)` and `EndMode3D()`) into an equivalent `PushMode3D(camera)` which will insert an automatic `defer EndXXX()` call into the scope for you.

## Regenerating the bindings

Run the `python` script [generator.py](generator.py) that reads `raylib.h` and generates [module.jai](module.jai). The previously written module is saved in old_module.jai.
After generating the bindings by running the python script, copy the "raylib" folder and paste it in "yourProject/modules". Now, when building your project, you can use the following import:

 ```#import "raylib";```.
 
If you are on Linux, it searches for libraylib.so in the system. This is the default place of the library when installing on Linux (using package manager, quick start or manual build method).
In raylib/lib/ there are .dll files, use it at your own risk. It is always recommended to run your own built .dll files. Bear in mind that those .dll files are only for Windows as well.

models/models_mesh_generation.jai takes a while to close
models/models_point_rendering.jai crahes when unloading model
shaders/shaders_basic_pbr.jai takes a while to close

