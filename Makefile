cur_src = src/02_save_data

img: ${cur_src}/boot.s
	nasm ${cur_src}/boot.s -o ${cur_src}/boot.img -l ${cur_src}/boot.lst

boot: img
	qemu-system-i386 ${cur_src}/boot.img
clean:
	rm ${cur_src}/*.img ${cur_src}/*.lst