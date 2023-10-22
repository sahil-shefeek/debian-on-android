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

  ```sh
  wget -q https://raw.githubusercontent.com/sahil-shefeek/debian-on-android/master/debmux.sh && chmod +x debmux.sh && sh debmux.sh

