Steps to build the installer:

1. Run `git submodule update --init --recursive` to initialize submodules.
2. Compile or place the NvUnboost binary in `..\x64\Release\NvUnboost.exe`.
3. Open `setup.iss` file using Inno Setup Compiler (version 6.4 or higher).
4. Click on "Build" and then "Compile" to create the installer.