#!/usr/bin/env bash

function usage {
cat << END

usage: $0 [options]

Utility script to install kvm to speed android studio emulator

Option:

-c: Make sure your CPU support hardware virtualization for KVM to run and install
-u: Check if your processor supports KVM or not by the following command
-i: Install KVM
END
}

OPTSTRING=":cui"

if [[ -z $@ ]]
then
	usage
	exit 1
fi
while getopts $OPTSTRING opt; do
	case $opt in
		c)
			egrep -c '(vmx|svm)' /proc/cpuinfo
			;;
		u)
			kvm-ok
			;;
		i)
			sudo apt-get update
			sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
			
			sudo adduser $USER kvm
			sudo adduser $USER libvirtd

			echo "******Please logout/login for changes to take effect.******"
			echo "Make sure that you have installed Intel X86 Atom System Image, if not install now from your android SDk manager before creating emulator."
			;;
		\?)
			usage
			;;
	esac
done
