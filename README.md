# Static tools

Statically compiled e2fsprogs (ext2/ext3/ext4 filesystem utilities) using musl libc for maximum portability.

## Features

- **Statically linked**: No runtime dependencies required
- **musl libc**: Smaller binaries and better portability
- **Pinned to NixOS 25.11**: Reproducible builds
- **CI/CD**: Automated builds and releases via GitLab CI

## Included Tools

The package includes all standard e2fsprogs utilities:

- `mke2fs` / `mkfs.ext2` / `mkfs.ext3` / `mkfs.ext4` - Create ext filesystems
- `e2fsck` / `fsck.ext2` / `fsck.ext3` / `fsck.ext4` - Check and repair ext filesystems
- `resize2fs` - Resize ext filesystems
- `tune2fs` - Adjust filesystem parameters
- `dumpe2fs` - Dump filesystem information
- `debugfs` - Debug ext filesystems
- `e2label` - Change filesystem label
- `e2image` - Save critical ext filesystem metadata

## Building

### Build Commands

```bash
# Build the package
nix build

# The binaries will be in ./result/bin/
ls -la result/bin/

# Run a binary
./result/bin/mke2fs --version
```

## License

This repository contains just build configurations. The e2fsprogs software itself is licensed under GPL-2.0.

## Resources

- [e2fsprogs](https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
