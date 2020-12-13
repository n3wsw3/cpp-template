# cpp-template

The purpose for this template is to make it easier and faster to get a c++ project up and running while also allowing for further expansion.

## cpp-project

The template consists of a static library project called cpp-project, i.e. cpp-project isn't supposed to be run by it self but is supposed to be included in another project (By default the only one is `tests`). So instead of changing cpp-project to a ConsoleApp or similar, I would recommend setting up a sandbox project that uses cpp-project as a library. A sandbox project would be setup similarly to `tests` (See [Creating a Sandbox Application](#Creating-a-Sandbox-Application)).

The intended use is to change this name to your actual project name. To change the name properly you need to change the name of the cpp-project folders, and also change all instances of that name in **all** `premake5.lua` files. If you want more information about what settings in the `premake5.lua` files do, I would redirect you to their pretty awesome [wiki](https://github.com/premake/premake-core/wiki).

Cpp-project is setup so all of your header files are in the include directory while the implementation files are in src (notice only `.cpp` files and `.h` files are included in the src and include directories respectively by default).

## tests

The `tests` project is a ConsoleApp project. By default it includes the [GoogleTest framework](https://github.com/google/googletest) and the idea is to use this project to test the functions of cpp-project. As it is setup now, you won't see an entry point. That is because GoogleTest includes it's own implementation. However, if you decide you need, or want, your own entry point, you will need to exclude `gtest_main.cc` from the includes files in `test/vendor/premake5.lua` (similar to how `gtest-all.cc` is excluded).

By default all `.cpp` files in the `src` directory will be included when compiling.

## Build

It uses premake5 as a build system, which allows for development and building on multiple platforms without hassle (For more information visit premake5's [wiki](https://github.com/premake/premake-core/wiki)).

**Never** change anything inside `Makefiles`, Solution files, and similar. **Only** change options in the `premake5.lua` files, otherwise the changed options won't change when rebuilding the projects.

#### Build files

The build files for all projects will be located in the top-level `bin` and `bin-int` directories. `bin-int` stores all intermediate files necessary for building. The folder structure is as follows `<Configuration>-<System>-<Architecture>` where configuration is Release or Debug; System is windows, linux or macos; and architecture is x86_64 (since right now only compiling for 64 bit is added, might change in the future).

### Linux

Generate the Make files by running `./GenerateProject.sh` in the root directory. Then to build the project run `make` (defaults to Debug). If you want to build for a specific configuration run `make config=<Configuration>` (for example `make config=Release`). See [Build files](#build-files) for location of built files.

### Windows

Generate Visual Studio Solutions by running `GenerateProject.bat <action>` where `<action>` is defined [here](https://github.com/premake/premake-core/wiki/Using-Premake#using-premake-to-generate-project-files); if no action is specified, then action will be set to vs2019. Build like any other Visual Studio Project. See [Build files](#build-files) for location of built files.

## Customization

Follow the instructions in [cpp-project](#cpp-project) to change the name to your project. Then add your `.h` files in the include directory and your `.cpp` files in the src directory. Then write tests for the code you added (See [tests](#tests) for more information).

### Adding Libraries

If you want to add another library or replace `GoogleTest` for another Unit Testing Framework:

- Add it as a submodule by running `git submodule add <repository> <path>` where path is a vendor folder, for example `tests/vedor` or `vendor`.
- If the project already uses `premake5` as a build system then include the project the same way `GoogleTest` and `cpp-project` is included in `tests`.
- Otherwise you have to write your own `premake5.lua` file for that library (like I did for `GoogleTest`). Basically copy paste the `GoogleTest` `premake5.lua` file and change after liking.

### Creating a Sandbox Application

- Copy the `tests` directory, except the contents of `tests/vendor`
- Remove all references to `gtest` and `GoogleTest` in `tests/premake5.lua`
- Change project name in `tests/premake5.lua`
- Include project in root `premake5.lua`
- Regenerate project files. (See [windows](#windows) or [linux](#linux))
