# Wasm4Beef

Beef language bindings for [WASM-4](https://wasm4.org/) — a fantasy game console for building small games in WebAssembly. Wasm4Beef provides a complete binding layer over the WASM-4 API and includes a build script to compile your Beef project into a `.wasm` cartridge.

## Features

- Full bindings to the WASM-4 API via the `Wasm4` class
- A simple `Game<T>` base class with `Start()` and `Update()` lifecycle hooks
- Pre-configured build scripts for compiling to WebAssembly
- Hot-reload support via the `w4` CLI

## Quick Start

```beef
[AlwaysInclude]
class MyGame : Game<MyGame>
{
    protected override void Start()
    {
        Wasm4.Trace("Hello!");
    }

    protected override void Update()
    {
        Wasm4.Text("Hello world!", 35, 10);
    }
}
```

A complete working example is available in the `Sample/` directory.

## Manual Project Setup

If you'd prefer to set up a project from scratch rather than using the sample, follow these steps.

### 1. Install WASI SDK

Download and install the [WASI SDK](https://github.com/WebAssembly/wasi-sdk/releases) for your platform. Set variable `WASI_SDK_PATH` to your WASI SDK path. 
### 2. Add Wasm4Beef as a Remote Dependency

In Beef IDE, add this library as a remote workspace dependency, or clone it alongside your project and add it as a local dependency.

### 3. Configure `BeefSpace.toml`

Add the following Wasm32 configuration block to your workspace's `BeefSpace.toml`:

```toml
[Configs.Debug.Wasm32]
PreprocessorMacros = ["BF_CRT_DISABLE"]
TargetTriple = "wasm32-unknown-unknown"
BfSIMDSetting = "None"
BfOptimizationLevel = "Og"
AllocType = "CRT"
RuntimeKind = "Disabled"
ReflectKind = "Minimal"
EnableObjectDebugFlags = false
```

### 4. Configure `BeefProj.toml`

Add the following to your project's `BeefProj.toml`. This wires up the post-build step that links your compiled object into a `.wasm` cartridge, and configures the `w4` CLI as the debug runner:

```toml
[Configs.Debug.Wasm32]
PostBuildCmds = ["$(ProjectDir Wasm4)/build_debug.bat $(TargetPath) $(TargetDir)/$(ProjectName).wasm $(ProjectDir Wasm4)/imports.txt"]
DebugCommand = "w4"
DebugCommandArguments = "run --hot $(TargetDir)/$(ProjectName).wasm"
```

### 5. Set Project Type to Library

In your project settings, change the **Project Type** from `ConsoleApplication` to `Library`.

## Running Your Game

Once built, the `w4` CLI will launch your cartridge automatically if you run via the Beef debugger. You can also run it manually:

```sh
w4 run --hot path/to/YourGame.wasm
```

The `--hot` flag enables hot-reloading, so changes rebuild and reload without restarting.

## Requirements

- [Beef Language](https://www.beeflang.org/) (latest)
- [WASI SDK](https://github.com/WebAssembly/wasi-sdk/releases)
- [WASM-4 CLI (`w4`)](https://wasm4.org/docs/getting-started/setup)
