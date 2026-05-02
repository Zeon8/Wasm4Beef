@echo off
set ARCHIVE_PATH=%1
set OUTPUT_PATH=%2
set IMPORTS_FILE=%3
%WASI_SDK_PATH%\bin\clang.exe -mexec-model=reactor -Wl,-zstack-size=14752,--no-entry,--import-memory,--initial-memory=65536,--max-memory=65536,--stack-first,--allow-undefined-file=%IMPORTS_FILE%,--export=start,--export=update -o %OUTPUT_PATH% %ARCHIVE_PATH%