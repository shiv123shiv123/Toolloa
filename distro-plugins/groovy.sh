##
## Plug-in for installing Ubuntu groovy (20.04).
##

DISTRO_NAME="Ubuntu 20.10(Groovy)"
Commit_state="0.01"

# Returns download URL.
get_download_url() {
	# Ubuntu groovy does not provide tarballs for x86 32bit.
	case "$(uname -m)" in
		aarch64)
			echo "https://cloud-images.ubuntu.com/groovy/current/groovy-server-cloudimg-arm64-root.tar.xz"
			;;
		armv7l|armv8l)
			echo "https://cloud-images.ubuntu.com/groovy/current/groovy-server-cloudimg-armhf-root.tar.xz"
			;;
		x86_64)
			echo "https://cloud-images.ubuntu.com/groovy/current/groovy-server-cloudimg-amd64-root.tar.xz"
			;;
	esac
}

# Define here additional steps which should be executed
# for configuration.
distro_setup() {
	# Hint: $PWD is the distribution rootfs directory.
	#echo "hello world" > ./etc/motd

	# Run command within proot'ed environment with
	# run_proot_cmd function.
	# Uncomment this to do system upgrade during installation.
	 run_proot_cmd apt update
	 run_proot_cmd apt upgrade -yq
}
