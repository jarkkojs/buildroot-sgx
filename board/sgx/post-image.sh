#!/usr/bin/env bash

RUN_SCRIPT="${BINARIES_DIR}/run.sh"

cat << EOF > "$RUN_SCRIPT"
#!/usr/bin/env bash

BINARIES_DIR="\${0%/*}/"
cd \${BINARIES_DIR}

exec qemu-system-x86_64 -M pc \\
			-accel kvm \\
                        -cpu host,+sgx,+sgxlc \\
			-object memory-backend-epc,id=mem1,size=16M,prealloc=on \\
			-M sgx-epc.0.memdev=mem1,sgx-epc.0.node=0 \\
                        -kernel bzImage \\
			-drive file=rootfs.ext2,if=virtio,format=raw \\
			-append "rootwait root=/dev/vda console=tty1 console=ttyS0" \\
			-net nic,model=virtio \\
			-net user \\
			-nographic
EOF

chmod +x "$RUN_SCRIPT"
