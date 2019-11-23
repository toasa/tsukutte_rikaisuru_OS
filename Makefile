src_path = src/00_boot_only

img: ${src_path}/boot.s
	nasm ${src_path}/boot.s -o ${src_path}/boot.img -l ${src_path}/boot.lst

clean:
	rm ${src_path}/*.img ${src_path}/*.lst