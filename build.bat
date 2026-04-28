@echo off
set ARCHIVE_PATH=build\Debug_Wasm32\Wasm4.Game\Wasm4.Game.a
set OUTPUT_PATH=build\Debug_Wasm32\Wasm4.Game\Wasm4.Game.wasm
%WASI_SDK_PATH%\bin\clang.exe -mexec-model=reactor -Wl,-zstack-size=14752,--no-entry,--import-memory,--initial-memory=65536,--max-memory=65536,--stack-first,--allow-undefined-file=imports.txt,--export-if-defined=start,--export-if-defined=update -o %OUTPUT_PATH% %ARCHIVE_PATH%