img: src/boot.s
	nasm src/boot.s -o src/boot.img -l src/boot.lst

boot: img
	qemu-system-i386 src/boot.img

clean:
	rm src/*.img src/*.lst