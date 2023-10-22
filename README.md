# debmux

![Header Image](https://www.debian.org/logos/openlogo-nd-100.png)


![GitHub Issues](https://img.shields.io/github/issues/sahil-shefeek/debian-on-android)


## What is it

- A shell script to install [Debian 12 ("bookworm")](https://www.debian.org/releases/bookworm/) - the current "stable" release and [Debian 11 ("bullseye")](https://www.debian.org/releases/bullseye/) - the current "oldstable" release via [debootstrap](https://wiki.debian.org/Debootstrap) in a [Termux](https://wiki.termux.com/wiki/Main_Page) environment.
- Supported architectures include: armel, armhf, arm64, i386, amd64.
- **Note:** Android 10 and below is no longer maintained and may break.

## How to Use It

- Install [Termux](https://termux.com/).
- Optionally modify the configuration lines near the top of the script.
- Download `debmux.sh` for Android 10+ devices and run it:

  ```shell
  wget -q https://raw.githubusercontent.com/sahil-shefeek/debian-on-android/master/debmux.sh && chmod +x debmux.sh && sh debmux.sh

# Alternative Method
### using PRoot Distro

[PRoot Distro](https://github.com/termux/proot-distro) is a Bash script wrapper for the utility `proot` designed for easy management of chroot-based Linux distribution installations. It does not require root or any special ROM, kernel, etc. Everything you need to get started is the latest version of the Termux application. See [Installing PRoot](https://github.com/termux/proot-distro#installing) for details.

**Important Note:** PRoot Distro is not a virtual machine or a traditional chroot. It shares the same kernel as your Android system, so updating it through the package manager won't work.

This script should never be run as the root user. If you do so, file permissions and SELinux labels could get messed up, and there's a possibility of damaging the system if executed as root. For safety, PRoot Distro checks the user ID before running and refuses to work if it detects a user ID of 0 (root).

To know more visit [PRoot](https://github.com/termux/proot-distro).

