# README
Good way to check diskspeed (usb):
```
(BAD)
daan@rpi4home1:~/project/media-server $ dd if=/dev/zero of=$HOME/iotest.bin bs=4k count=10000 conv=fdatasync status=progress
10000+0 records in
10000+0 records out
40960000 bytes (41 MB, 39 MiB) copied, 96.8826 s, 423 kB/s
daan@rpi4home1:~/project/media-server $ dd if=/dev/zero of=$HOME/iotest.bin bs=4k count=10000 conv=fdatasync status=progress
10000+0 records in
10000+0 records out
40960000 bytes (41 MB, 39 MiB) copied, 13.9114 s, 2.9 MB/s
daan@rpi4home1:~/project/media-server $ dd if=/dev/zero of=$HOME/iotest.bin bs=4k count=10000 conv=fdatasync status=progress
10000+0 records in
10000+0 records out
40960000 bytes (41 MB, 39 MiB) copied, 139.099 s, 294 kB/s
```
