#!/data/data/com.termux/files/usr/bin/sh

# oldstable, stable, testing, unstable
BRANCH=stable
# base(258M), minbase(217M), buildd, fakechroot
VAR=minbase
# list_close_debian_mirrors.sh
REPO=http://ftp.debian.org/debian/

set -e
trap '[ $? -eq 0 ] && exit 0 || (echo; echo "termux-info:"; termux-info)' EXIT

if [ ! -d ~/debian-$BRANCH ] ; then
	ARCH=$(uname -m)
	case $ARCH in
		aarch64) ARCH=arm64 ;;
		x86_64) ARCH=amd64 ;;
		i686) ARCH=i386 ;;
		armv7l) ARCH=armhf ;;
		armv8l) apt-get -qq install getconf; if [ $(getconf LONG_BIT) -eq 64 ]; then ARCH=arm64; else ARCH=armhf; fi ;;
		*) echo "Unsupported architecture $ARCH"; exit ;;
	esac
	apt-get -qq update
	apt-get -qq dist-upgrade
	apt-get -qq install debootstrap proot wget
	debootstrap \
		--variant=$VAR \
		--exclude=systemd \
		--arch=$ARCH \
		$BRANCH \
		~/debian-$BRANCH \
		$REPO
fi

#Alias for easy launch
if [ -n "$BASH_VERSION" ]; then
    echo 'alias start-deb="sh debmux.sh"' >> "$HOME/.bashrc"
    echo "Alias 'start-deb' for bash has been added. You can run debian by using 'start-deb'."
elif [ -n "$ZSH_VERSION" ]; then
    echo 'alias start-deb="sh debmux.sh"' >> "$HOME/.zshrc"
    echo "Alias 'start-deb' for zsh has been added. You can run debian by using 'start-deb'."
else
    echo "Unsupported shell. Please add the alias manually for your shell or use sh debmux.sh to run debian."
fi

echo "Logging you in..."

unset LD_PRELOAD
proot \
	-0 \
	--link2symlink \
	-r ~/debian-$BRANCH \
	-w /root \
	-b /dev/ \
	-b /sys/ \
	-b /proc/ \
	-b /data/data/com.termux/files/home \
	/usr/bin/env -i \
	HOME=/root \
	TERM="xterm-256color" \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin \
	/bin/bash --login
