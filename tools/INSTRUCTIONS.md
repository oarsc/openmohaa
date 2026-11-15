# OpenMoHAA development container

Docker/distrobox setup for compiling and running OpenMoHAA on Linux.

| File | Purpose |
| --- | --- |
| `Dockerfile` | Debian 13 image with build tools and runtime dependencies. |
| `do` | Builds the image and runs one-off commands. |
| `dtb` | Creates/enters the persistent `moh` distrobox container. |
| `compile.sh` | Configures, builds and installs into `build/install`. |
| `run.sh` | Launches the base game from `build/install`. |

The `data/` folder is bind-mounted, not copied into the image. `compile.sh`
leaves it untouched.

## Requirements

- Docker with Buildx
- distrobox
- For NVIDIA GPUs: host driver and NVIDIA Container Toolkit

## Usage

First time only: build the image and create the container.

```sh
tools/do
tools/dtb
```

Compile/install and run:

```sh
tools/dtb /mohaa/tools/compile.sh
tools/dtb /mohaa/tools/run.sh
```

To work inside the container instead:

```sh
tools/dtb
/mohaa/tools/compile.sh
/mohaa/tools/run.sh
```

## Expansions

Pass `sh` for Spearhead or `bt` for Breakthrough. Without an argument,
`run.sh` launches the base game:

```sh
tools/dtb /mohaa/tools/run.sh       # Allied Assault
tools/dtb /mohaa/tools/run.sh sh    # Spearhead
tools/dtb /mohaa/tools/run.sh bt    # Breakthrough
```

## Notes

- Check GPU acceleration with `tools/dtb glxinfo -B`.
- `Couldn't load default.cfg` means `fs_basepath` does not point to the folder containing `main/`, `mainta/` and `maintt/`.
- Build output goes to `build/`, which is ignored by git.
- Use `tools/do <command>` for other one-off commands in the build image.
