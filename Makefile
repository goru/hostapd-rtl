all:
	# clean up src
	cd src && \
	git checkout . && \
	git clean -df
	
	# apply arch patches
	patch -d src -p1 -i "../patches/archlinux/hostapd-2.3-noscan.patch"
	patch -d src -p1 -i "../patches/archlinux/openvswitch.patch"
	
	# apply misc patches
	patch -d src -p1 -i "../patches/noscan-config.patch"
	
	# make module
	make -C src/hostapd
