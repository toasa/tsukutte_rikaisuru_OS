cur_src = src/00_boot_only

img: ${cur_src}/boot.s
	nasm ${cur_src}/boot.s -o ${cur_src}/boot.img -l ${cur_src}/boot.lst

boot: ${cur_src}/boot.img
	qemu-system-i386 ${cur_src}/boot.img
clean:
	rm ${cur_src}/*.img ${cur_src}/*.lst