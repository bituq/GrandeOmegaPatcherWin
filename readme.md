# Grande Omega Patcher Windows

A dependency patcher for Grande Omega (GO), inspired by an already existing [patcher](https://github.com/Matthbo/GrandeOmega-patcher/blob/master/readme.md).

This project aims to be an easy and straightforward way for Windows users to install GO. No need to install any additional dependencies to run the installer.

## Features
- Installs latest version of GO if available.
- Patches GO dependencies to their latest versions.
- Pick whichever dependencies you'd like to install.

## How to use
Head over to the **releases** section of this repository, and download whichever version you want. You don't need to install any dependencies. Run it as you would with any traditional Windows installer.

## Build from source
This installer is written in [NSIS](https://nsis.sourceforge.io/Download), which is required to be installed on your system to build the project. NSIS has a useful [reference](https://nsis.sourceforge.io/Docs/Contents.html) manual to read for any additional details.

### Build using the CLI
`Main.nsi` is the entry point of the application. The following command will build the project in the active directory:
```
> makensis main.nsi
```

For production, it is recommended you use **LZMA** compression for the best compression ratio.
```
> makensis /X"SetCompressor /FINAL lzma" main.nsi
```